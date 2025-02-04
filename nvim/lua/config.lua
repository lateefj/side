-- Show line numbers
--
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
vim.cmd [[colorscheme habamax]]
-- Presentation mode
vim.o.background = 'dark'

-- Enable spelling
vim.wo.spell = true

-- Copy / pasta clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
