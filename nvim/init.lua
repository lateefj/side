-- Clean starting over custom neovim configuration

-- Mouse enable all
vim.opt.mouse = "a"

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

-- Leader!!!
vim.g.mapleader = ","

-- Show line numbers
vim.wo.number = true
-- Install Lazy
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("plugins")

-- Import keyboard mappings
require("keymap")

-- Configuraiton:
require("config")
-- Autoformat
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- Copy / pasta clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.wo.spell = true

-- Load any external configuration
local side_path = vim.fn.expand("$HOME/.side")
local neoside_path = side_path .. "/neoside.lua"
if io.open(neoside_path) ~= nil then
  vim.opt.rtp:prepend(side_path)
  vim.api.nvim_command("source " .. neoside_path)
end
