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
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Colorscheme
vim.colorscheme = 'onedark'
-- Presentation mode
vim.o.background = 'dark'

require('mini.animate').setup()
require('mini.basics').setup()
require('mini.bracketed').setup()
require('mini.colors').setup()
require('mini.comment').setup()
require('mini.completion').setup()
require('mini.diff').setup()
require('mini.extra').setup()
require('mini.git').setup()
require('mini.hipatterns').setup()
require('mini.notify').setup()
require('mini.pairs').setup()
require('mini.bufremove').setup()
require('mini.sessions').setup()
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()
require('mini.visits').setup()

vim.cmd [[colorscheme onedark]]


require("go").setup()
