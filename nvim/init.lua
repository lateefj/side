-- Clean starting over custom neovim configuration

-- Mouse enable all
vim.opt.mouse = "a"

-- Search:
--
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

-- Leader!!!
vim.g.mapleader = ","

-- Import keyboard mappings
require("keymap")

-- Plugins
require("plugins")

-- Configuraiton:
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}


