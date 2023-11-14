-- Show line numbers
vim.wo.number = true
-- Relative line numbers
vim.wo.relativenumber = true
-- Search:
--
-- Ignore case
vim.opt.ignorecase = true
-- Ignore upper case unless search has upper case letters
vim.opt.smartcase = true
-- Highlight search results
vim.opt.hlsearch = true

-- Text lines:
--
-- Wrap long lines
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true




vim.opt.termguicolors = true
vim.cmd.colorscheme("onedark")
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Presentation mode
vim.o.background = 'dark'

vim.api.nvim_create_user_command("ZigLast", function()
  local overseer = require("overseer")
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "restart")
  end
end, {})

vim.api.nvim_create_user_command("ZigStopLast", function()
  local overseer = require("overseer")
  local tasks = overseer.list_tasks({ recent_first = true })
  if vim.tbl_isempty(tasks) then
    vim.notify("No tasks found", vim.log.levels.WARN)
  else
    overseer.run_action(tasks[1], "stop")
  end
end, {})

vim.api.nvim_create_user_command("ZigTest", function()
  local overseer = require("overseer")
  local test_names = {}
  local ti = 0

  local buf_content = vim.api.nvim_buf_get_lines(vim.api.nvim_get_current_buf(), 0, -1, false)
  for _, l in pairs(buf_content) do
    local test_name = string.match(l, '^%s*test%s+"([%w_%s]+)"%s*{$')
    if test_name ~= nil then
      ti = ti + 1
      if zig_test_filter == test_name then
        table.insert(test_names, 1, test_name)
      else
        table.insert(test_names, ti, test_name)
      end
    end
  end
  table.insert(test_names, ti + 1, "all")
  local file = vim.fn.expand("%:p")
  vim.print(test_names)
  zig_test_filter = "___"

  vim.ui.select(test_names, { prompt = "Test Filter: " }, function(choice)
    if choice == "all" then
      zig_test_filter = ""
    else
      zig_test_filter = choice
    end
    local filter = '"' .. zig_test_filter .. '"'
    local args = { "test", "--test-filter", filter, file, "-femit-bin=test" }
    local async = require("plenary.async")
    async.run(function()
      overseer.run_template({
        name = "zig_test",
        params = { args = args },
      })
    end, function() end)
  end)
end, {})

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

return {
  "stevearc/overseer.nvim",
  config = true,
  keys = {
    { "<leader>zt",  "<cmd>ZigTest<CR>",        desc = "Zig Test" },
    { "<leader>zl",  "<cmd>ZigLast<CR>",        desc = "Zig Last" },
    { "<leader>zsl", "<cmd>ZigStopLast<CR>",    desc = "Zig Stop Last" },
    { "<leader>zot", "<cmd>OverseerToggle<CR>", desc = "Zig Tasks Toggle" },
  },
  opts = {
    templates = { "builtin", "user.zig_test" },
    strategy = {
      "toggleterm",
      use_shell = false,
      open_on_start = false,
      close_on_exit = true,
      auto_scroll = true,
      hidden = true,
    },
  },
}
