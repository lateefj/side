local spinner = {}

function spinner.start_loading_spinner(buf)
  local spinner_frames = { '|', '/', '-', '\\' }
  local frame_index = 1
  local spinner_line = nil

  local function update_spinner()
    local num_lines = vim.api.nvim_buf_line_count(buf)

    -- If there are no lines, set an empty line
    if num_lines == 0 then
      vim.api.nvim_buf_set_lines(buf, 0, 0, false, { '' })
      num_lines = 1
    end

    -- Clear the previous spinner line if it exists
    if spinner_line and spinner_line > 0 and spinner_line <= num_lines then
      local current_line = vim.api.nvim_buf_get_lines(buf, spinner_line - 1, spinner_line, false)[1] or ""
      local updated_line = string.gsub(current_line, '^[|/-\\] Loading...', '')
      vim.api.nvim_buf_set_lines(buf, spinner_line - 1, spinner_line, false, { updated_line })
    end

    -- Set the new spinner character at the last line of the buffer
    spinner_line = num_lines
    local spinner_char = spinner_frames[frame_index]
    local spinner_text = spinner_char .. ' Loading...'
    vim.api.nvim_buf_set_lines(buf, spinner_line - 1, spinner_line, false, { spinner_text })

    -- Move to the next frame
    frame_index = (frame_index % #spinner_frames) + 1
  end

  -- Update the spinner every 100 ms
  local timer = vim.loop.new_timer()
  timer:start(0, 100, vim.schedule_wrap(function()
    update_spinner()
  end))

  return timer
end

function spinner.stop_loading_spinner(timer, buf)
  timer:stop()
  timer:close()

  -- Clear the spinner line
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  if #lines > 0 then
    vim.api.nvim_buf_set_lines(buf, #lines - 1, #lines, false, { '' })
  end
end

local utils = {}

-- Wrap text to fit within a certain width
function utils.wrap_text(text, max_width)
  local lines = {}
  for line in text:gmatch("[^\r\n]+") do
    while #line > max_width do
      local wrap_pos = line:sub(1, max_width):find("%s[^%s]*$")
      if not wrap_pos then
        wrap_pos = max_width
      end
      table.insert(lines, line:sub(1, wrap_pos - 1))
      line = line:sub(wrap_pos + 1)
    end
    table.insert(lines, line)
  end
  return lines
end

-- Get the visual selection in the vsiual mode
function utils.get_visual_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  local lines = vim.fn.getline(start_pos[2], end_pos[2])
  if #lines == 0 then
    return ""
  end

  lines[1] = string.sub(lines[1], start_pos[3])
  lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])

  return table.concat(lines, "\n")
end

function utils.get_selected_text()
  local mode = vim.fn.mode()
  local prompt

  if mode == 'v' or mode == 'V' then
    prompt = utils.get_visual_selection()
  else
    prompt = vim.api.nvim_get_current_line()
  end

  return prompt
end

function utils.get_current_buffer_file_extension()
  -- Get the buffer number of the current buffer
  local buf = vim.api.nvim_get_current_buf()
  -- Get the filename of the buffer
  local filename = vim.api.nvim_buf_get_name(buf)
  return vim.fn.fnamemodify(filename, ":e")
end

function utils.get_buffer(width)
  local buf = vim.api.nvim_create_buf(false, true)

  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
  })

  return buf
end


local prompts = {}
function prompts.get_code_explanation_prompt()
  local selected_text = utils.get_visual_selection()
  local file_extension = utils.get_current_buffer_file_extension()
  return "This code is located in the file " ..
  vim.fn.expand('%:t') ..
  " and it has the extension " ..
  file_extension .. ".\\n\\n" ..
  "Explain in detail what it does. Code:" ..
  selected_text
end
-- Default configuration
local default_config = {
  url = "http://localhost:11434",
  model = "deepseek-llm",
}

-- Configuration table to store the final configuration
local config = {}

function M.setup(user_config)
  -- Merge default config with user config
  config = vim.tbl_deep_extend("force", default_config, user_config or {})
end

local function get_data_from_llm(prompt, callback)
  local curl = require('plenary.curl')

  local llm_url = config.url .. "/api/generate"
  local request_data = {
    prompt = prompt,
    model = config.model,
    stream = true,
  }

  local request_data_json = vim.fn.json_encode(request_data)

  -- Use a coroutine to handle streaming
  local co = coroutine.create(function()
    curl.post(llm_url, {
      body = request_data_json,
      headers = {
        ['Content-Type'] = 'application/json',
      },
      stream = function(_, chunk)
        -- Handle streaming data
        if chunk then
          vim.schedule(function()
            local partial_response = vim.fn.json_decode(chunk)
            if partial_response and partial_response.response then
              callback(partial_response.response, partial_response.done)
            end
          end)
        end
      end
    })
  end)
  coroutine.resume(co)
end

M.get_explanation = function(prompt)
  local width = math.floor(vim.o.columns * 0.8)
  local buf = utils.get_buffer(width)

  -- Start the loading spinner
  local spinner_timer = spinner.start_loading_spinner(buf)
  -- Accumulate data as it comes in
  local accumulated_data = ""

  -- Callback function to handle streaming data
  local function handle_streaming_data(data, is_steam_end)
    if is_steam_end then
      -- Stop the loading spinner
      spinner.stop_loading_spinner(spinner_timer, buf)
      return
    end

    accumulated_data = accumulated_data .. data
    -- Wrap and set the lines in the buffer
    local lines = utils.wrap_text(accumulated_data, width)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  end

  -- Get suggestions with streaming
  get_data_from_llm(prompt, handle_streaming_data)
end

M.get_code_explanation = function()
  local prompt = prompts.get_code_explanation_prompt()
  M.get_explanation(prompt)
end
