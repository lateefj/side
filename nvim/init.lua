-- Clean starting over custom neovim configuration

-- Mouse enable all
vim.opt.mouse = "a"

-- "Bring me to your Leader!!!"
vim.g.mapleader = ","

-- Mini.nvim
-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
-- Install Lazy
--
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)

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
