-- Show line numbers
vim.wo.number = true
-- Relative line numbers
vim.wo.relativenumber = true
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

vim.opt.termguicolors = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Colorscheme
vim.cmd [[colorscheme expresso]]
-- Presentation mode
vim.o.background = 'dark'


require('mini.animate').setup()
require('mini.basics').setup()
require('mini.bracketed').setup()
require('mini.bufremove').setup()
require('mini.colors').setup()
require('mini.comment').setup()
require('mini.completion').setup({
  lsp_completion = {
    auto_setup  = true
  }
})
require('mini.diff').setup()
require('mini.extra').setup()
require('mini.files').setup()
require('mini.git').setup()
require('mini.hipatterns').setup()
require('mini.icons').setup()
require('mini.operators').setup()
require('mini.map').setup()
require('mini.notify').setup()
require('mini.pairs').setup()
require('mini.pick').setup()
require('mini.sessions').setup({
  directory = vim.fn.stdpath("data")
})
require('mini.starter').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()
require('mini.visits').setup()

require('codeassitant').setup({value=true, ops={foo="bar"}})

-- Code companion
require("codecompanion").setup({
  opts = {
    log_level = 'DEBUG',
    send_code = true,
  },
  strategies = {
    chat = {
      adapter = "starcoder",
    },
    inline = {
      adapter = "deepseek",
    },
    agent = {
      adapter = "deepseek",
    },
  },
  adapters = {
    llama3 = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "llama3", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "llama3.2:1b",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
    starcoder = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "starcode", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "starcoder2",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
    deepseek = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "deepseek", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "deepseek-coder",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
    codegemma = function()
      return require("codecompanion.adapters").extend("ollama", {
        name = "codegemma", -- Give this adapter a different name to differentiate it from the default ollama adapter
        schema = {
          model = {
            default = "codegemma:2b",
          },
          num_ctx = {
            default = 16384,
          },
          num_predict = {
            default = -1,
          },
        },
      })
    end,
  },
})

-- Possible to immediately execute code which depends on the added plugin
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'lua', 'vimdoc', 'go', 'zig', 'python', 'html', 'bash', 'c', 'dot', 'fish', 'javascript', 'make', 'promql', 'sql', 'tcl', 'vim', 'yaml' },
  highlight = { enable = true },
})
-- Setup go later
MiniDeps.later(function() require("go").setup() end)

-- Lsp Format
require("lsp-format").setup {}

-- Lsp Zero
local lsp_zero = require('lsp-zero')


-- lsp_attach is where you enable features that only work
-- if there is a language server active in the file
local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

require('lspconfig').bashls.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').zls.setup({})
require('lspconfig').vimls.setup({})
require('lspconfig').lua_ls.setup({})
MiniDeps.later(function()
  require('lspconfig').pylsp.setup({})
  require('lspconfig').dotls.setup({})
  require('lspconfig').sqls.setup({})
end)

local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      -- can also be a function to dynamically calculate max width such as
      -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...',    -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default
    })
  }
})
-- Setup goimport later
MiniDeps.later(function()
  -- Run gofmt + goimports on save

  local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      require('go.format').goimports()
    end,
    group = format_sync_grp,
  })
end)

local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require("trouble.sources.telescope").add

local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<c-t>"] = open_with_trouble,
        ["<C-h>"] = "which_key"
      },
      n = { ["<c-t>"] = open_with_trouble },

    },
  },
})
-- Git signs setup
MiniDeps.later(function()
  require('gitsigns').setup()
  require('trouble').setup()
end)
