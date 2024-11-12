local CodeAssistant = {}

local H = {}

local function tprint(tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    local formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent + 1)
    else
      if type(v) == 'boolean' then
        print(formatting .. tostring(v))
      else
        print(formatting .. v)
      end
    end
  end
end
--- Module setup
---
---@param config table|nil Module config table. See |CodeAssistant.config|.
---
---@usage >lua
---   require('ac').setup() -- use default config
---   -- OR
---   require('ac').setup({}) -- replace {} with your config table
--- <
CodeAssistant.setup = function(config)
  -- Export module
  _G.CodeAssistant = CodeAssistant
  if config ~= nil then
    print('Config:')
    tprint(config)
    H.apply_config(config)
    print('Config now')
    tprint(CodeAssistant.config)
  end
end

H.apply_config = function(config)
  vim.validate({ config = { config, 'table', true } })
  config = vim.tbl_deep_extend('force', vim.deepcopy(H.default_config), config or {})
  CodeAssistant.config = config
end
--- Module config
---
--- Default values:
---@eval return MiniDoc.afterlines_to_code(MiniDoc.current.eval_section)
CodeAssistant.config = {}

-- Module default config
H.default_config = vim.deepcopy(CodeAssistant.config)

H.create_autocommands = function(config)
  local gr = vim.api.nvim_create_augroup('MiniCompletion', {})

  local au = function(event, pattern, callback, desc)
    vim.api.nvim_create_autocmd(event, { group = gr, pattern = pattern, callback = callback, desc = desc })
  end

  au('InsertCharPre', '*', H.auto_completion, 'Auto show completion')
  au('CompleteChanged', '*', H.auto_info, 'Auto show info')
  au('CursorMovedI', '*', H.auto_signature, 'Auto show signature')
  au('ModeChanged', 'i*:[^i]*', function() CodeAssistant.stop() end, 'Stop completion')
  au('CompleteDonePre', '*', H.on_completedonepre, 'On CompleteDonePre')
  au('TextChangedI', '*', H.on_text_changed_i, 'On TextChangedI')
  au('TextChangedP', '*', H.on_text_changed_p, 'On TextChangedP')

  if config.lsp_completion.auto_setup then
    local source_func = config.lsp_completion.source_func
    local callback = function() vim.bo[source_func] = 'v:lua.CodeAssistant.completefunc_lsp' end
    au('BufEnter', '*', callback, 'Set completion function')
  end

  au('ColorScheme', '*', H.create_default_hl, 'Ensure colors')
  au('FileType', 'TelescopePrompt', function() vim.b.minicompletion_disable = true end, 'Disable locally')
end

return CodeAssistant
