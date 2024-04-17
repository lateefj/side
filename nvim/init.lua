-- Clean starting over custom neovim configuration

-- Mouse enable all
vim.opt.mouse = "a"

-- Leader!!!
vim.g.mapleader = " "

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

-- Configuration
require("config")
-- Autoformat
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- Copy / pasta clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.wo.spell = true

local config_path = vim.fn.stdpath("config")

local side_config_path = "/lua/neoside/config.lua"
if io.open(config_path .. side_config_path) ~= nil then
  require("neoside.config")
end
