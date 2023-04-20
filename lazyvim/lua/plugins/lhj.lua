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
      require("wrapping").setup({
        auto_set_mode_filetype_allowlist = {
          "asciidoc",
          "gitcommit",
          "latex",
          "mail",
          "markdown",
          "rst",
          "tex",
          "text",
          "go",
          "lua",
        },
      })
      require("wrapping").soft_wrap_mode()
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
