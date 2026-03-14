-- Clean starting over custom neovim configuration

-- Mouse enable all
-- vim.opt.mouse = ""
vim.opt.mouse = nil

-- "Bring me to your Leader!!!"
vim.g.mapleader = ","

-- Initialize package

-- Editor Plugins + Config
require("editor")

-- IDE Plugins + Config
require("ide")

-- Configuration
require("config")
-- Import keyboard mappings
require("keymap")


-- local config_path = vim.fn.stdpath("config")
--
-- local side_config_path = "/lua/neoside/config.lua"
-- if io.open(config_path .. side_config_path) ~= nil then
--   require("neoside.config")
-- end
