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
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      require("wrapping").setup()
    end,
  },
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
}
