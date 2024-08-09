-- Minidep plugins
local add = MiniDeps.add

-- LSP
add({
  source = 'neovim/nvim-lspconfig',
  -- Supply dependencies near target plugin
  depends = { 'williamboman/mason.nvim', "lukas-reineke/lsp-format.nvim" },
})
add({
  source = 'VonHeikemen/lsp-zero.nvim',
  checkout = 'v4.x'
})

add({
  source = 'hrsh7th/nvim-cmp',
  depends = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'onsails/lspkind.nvim',
  }
})
-- Treesitter
add({
  source = 'nvim-treesitter/nvim-treesitter',
  -- Use 'master' while monitoring updates in 'main'
  checkout = 'master',
  monitor = 'main',
  -- Perform action after every checkout
  hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
})
-- Go
add({
  source = 'ray-x/go.nvim',
  depends = { -- optional packag
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  hooks = {
    post_checkout = function() require("go.install").update_all_sync() end,
  }
})
add({
  source = 'ray-x/navigator.lua',
  depends = {
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
  }
})
-- Fish
add({
  source = 'dag/vim-fish'
})
-- Awk
add({
  source = 'vim-scripts/awk.vim'
})
-- Clang
add({
  source = 'justmao945/vim-clang'
})
-- Zig
add({
  source = 'ziglang/zig.vim'
})
-- Asciidoctor
add({
  source = 'habamax/vim-asciidoctor'
})
-- Dap
add({
  source = 'rcarriga/nvim-dap-ui',
  depends = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  }
})
-- Trouble
add({
  source = 'folke/trouble.nvim'
})
-- Signatures
add({
  source = 'folke/neodev.nvim'
})
-- Telescope
add({
  source = 'nvim-telescope/telescope.nvim',
  depends = {
    'nvim-lua/plenary.nvim',
  }
})
-- Lua Snip
add({
  source = 'L3MON4D3/LuaSnip'
})
-- Git signs
add({
  source = 'lewis6991/gitsigns.nvim'
})
-- Which key
add({
 source = 'folke/which-key.nvim'
})
