return {
  -- Go
  {
    "fatih/vim-go",
  },
  -- Fish shell
  { "dag/vim-fish" },
  -- Awk
  { "vim-scripts/awk.vim" },
  -- clang
  { "justmao945/vim-clang" },
  -- Prolog
  { "soli/prolog-vim" },
  -- Zig
  { "ziglang/zig.vim" },
  -- Markdown
  { "ellisonleao/glow.nvim" },
  -- asciidoctor
  { "habamax/vim-asciidoctor" },
  { "mustache/vim-mustache-handlebars" },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- zls
        zls = {},
        -- gopls
        gopls = {},
      },
    },
  },
  -- Coloscheme
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    flavour = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    },
  },
  -- Configure LazyVim to load catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
