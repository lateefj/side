-- Lazy Plugin Manager
local lazy = {}


lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print("Installing lazy.nvim....")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      path,
    })
  end
end

vim.opt.rtp:prepend(lazy.path)

lazy.opts = {}

require("lazy").setup({
  --[[
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  --]]
  -- Colorscheme
  --{ "joshdick/onedark.vim" },
  --{ "shaunsingh/solarized.nvim" },
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000
  },
  -- lauline
  { "nvim-lualine/lualine.nvim" },
  { 'nvim-treesitter/nvim-treesitter' },
  -- cmp stuff
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'L3MON4D3/LuaSnip' },
  -- Buff line
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  { "neovim/nvim-lspconfig" },
  { 'hrsh7th/cmp-nvim-lsp' },
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
  -- Python
  { "python-lsp/python-lsp-server" },
  -- Markdown
  { "ellisonleao/glow.nvim" },
  -- asciidoctor
  { "habamax/vim-asciidoctor" },
  {
    'tigion/nvim-asciidoc-preview',
    ft = { 'asciidoc' },
    -- opts = {},
  },
  -- Muastache template
  { "mustache/vim-mustache-handlebars" },
  { "neovim/nvim-lspconfig" },
  -- Comment toggle
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  -- Surround text
  { "tpope/vim-surround" },
  -- Teleschope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim"
  },
  { "nvim-telescope/telescope-fzf-native.nvim" },
  -- autoformat on save
  { "lukas-reineke/lsp-format.nvim" },
  -- Highlight comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    signs = true,      -- show icons in the signs column
    sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    opts = {
    }
  },
  {
    'stevearc/overseer.nvim',
    opts = {},
  },
  -- Autoclose
  { 'm4xshen/autoclose.nvim' },
})


require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {     -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
  term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false,              -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15,            -- percentage of the shade to apply to the inactive window
  },
  no_italic = false,              -- Force no italic
  no_bold = false,                -- Force no bold
  no_underline = false,           -- Force no underline
  styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" },      -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {},
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = false,
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})
-- Plugin Config:
require("lualine").setup({
  options = {
    --theme = "solarized",
    theme = "catppuccin",
    --theme = "onedark",
    icons_enabled = true,
  },
})
require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- The following example advertise capabilities to `clangd`.
require 'lspconfig'.clangd.setup {
  capabilities = capabilities,
}


require('bufferline').setup({
  options = {
    mode = 'buffers',
    offsets = {
      { filetype = 'NvimTree' }
    },
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = { attribute = 'fg', highlight = 'Function' },
      italic = false
    }
  }
})

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  ensure_installed = {
    'javascript',
    'typescript',
    'tsx',
    'css',
    'json',
    'lua',
    'go',
    'zig',
    'python',
  },
})

require('Comment').setup()

local lspconfig = require('lspconfig')

local lsp_defaults = lspconfig.util.default_config
-- Capabilities for server
lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- Lsp Format
require("lsp-format").setup {}
-- Gopla
lspconfig.gopls.setup {
  on_attach = require("lsp-format").on_attach
}
-- zig Lsp
lspconfig.zls.setup {}
-- Lua LSP setup
lspconfig.lua_ls.setup({
  on_attach = require("lsp-format").on_attach,
  single_file_support = true,
  flags = {
    debounce_text_changes = 150,
  },
})

-- Python
require "lspconfig".pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        black = {
          cache_config = true,
          enabled = true,
          line_length = 119,
        },
        flake8 = {
          enabled = true,
          maxLineLength = 119,
        },
        mypy = {
          enabled = true,
        },
        pycodestyle = {
          enabled = false,
        },
        pyflakes = {
          enabled = false,
        },
      }
    }
  }
}

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'buffer',   keyword_length = 3 },
    { name = 'luasnip',  keyword_length = 2 },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
})

require('overseer').setup()

require("autoclose").setup()
