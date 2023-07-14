-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.go.background = "dark"

vim.g.mustache_abbreviations = "1"

vim.wo.wrap = true
vim.wo.linebreak = false
vim.wo.list = false

vim.cmd("inoremap jj <Esc>")
vim.cmd("set spell")
