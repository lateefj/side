-- Initialize the basic packages
vim.pack.add({
  'https://github.com/nvim-mini/mini.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
})

-- Editor configuration
require('mini.ai').setup()
require('mini.animate').setup()
--require('mini.base16').setup()
require('mini.basics').setup()
require('mini.bracketed').setup()
require('mini.bufremove').setup()
require('mini.colors').setup()
require('mini.comment').setup()
require('mini.completion').setup({
  lsp_completion = {
    auto_setup = true
  },
  fallback_action = '<C-n>'
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
require('mini.snippets').setup()
require('mini.sessions').setup({
  directory = vim.fn.stdpath("data")
})
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()
require('mini.visits').setup()

vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update()
end, {})   
