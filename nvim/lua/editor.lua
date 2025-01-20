local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now
local map = vim.keymap.set

now(function()

  -- Git signs
  add({
    source = 'lewis6991/gitsigns.nvim'
  })
  add({
    source = 'echasnovski/mini.pick'
  })

  -- Editor configuration
  require('mini.ai').setup()
  require('mini.animate').setup()
  require('mini.basics').setup()
  require('mini.bracketed').setup()
  require('mini.bufremove').setup()
  require('mini.colors').setup()
  require('mini.comment').setup()
  require('mini.completion').setup({
    lsp_completion = {
      auto_setup = true
    }
  })
  require('mini.clue').setup()
  require('mini.diff').setup()
  require('mini.extra').setup()
  require('mini.indentscope').setup()
  require('mini.jump').setup()
  require('mini.files').setup()
  require('mini.git').setup()
  require('mini.hipatterns').setup()
  require('mini.icons').setup()
  require('mini.operators').setup()
  require('mini.map').setup()
  require('mini.notify').setup()
  require('mini.pairs').setup()
  require('mini.pick').setup()
  require('mini.sessions').setup({
    directory = vim.fn.stdpath("data")
  })
  require('mini.starter').setup()
  require('mini.statusline').setup()
  require('mini.surround').setup()
  require('mini.tabline').setup()
  require('mini.trailspace').setup()
  require('mini.visits').setup()


end)

later(function()
  local picker = require('mini.pick')
  picker.setup()
  -- Override picker 
  vim.ui.select = MiniPick.ui_select
  require('gitsigns').setup()
  -- Mini keys
  map('n', 'mm', function() MiniMap.toggle() end, { desc = "toggle minimap" })
  map('n', 'msa', function() MiniSurround.add() end, { desc = "MiniSurround add" })
  map('n', 'msd', function() MiniSurround.delete() end, { desc = "MiniSurround add" })
  map('n', 'msw', function() MiniSessions.write() end, { desc = "MiniSession write" })

end)
