local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now
local map = vim.keymap.set

now(function()
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

  -- LSP
  add({
    source = 'neovim/nvim-lspconfig',
    -- Supply dependencies near target plugin
    depends = { 'williamboman/mason.nvim', "lukas-reineke/lsp-format.nvim" },
  })
  -- Zero configuration
  add({
    source = 'VonHeikemen/lsp-zero.nvim',
    checkout = 'v4.x'
  })
  -- Autocomplete
  add({
    source = 'hrsh7th/nvim-cmp',
    depends = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'onsails/lspkind.nvim',
    }
  })
  -- Go
  add({
    source = 'ray-x/go.nvim',
    depends = { -- optional packag
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
    },
    hooks = {
      post_checkout = function() require("go.install").update_all_sync() end,
    }
  })
  -- Navigator
  add({
    source = 'ray-x/navigator.lua',
    depends = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
    }
  })

  -- Go setup
  require("go").setup()

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

  require('lspconfig').gopls.setup({})
  require('lspconfig').bashls.setup({})
  require('lspconfig').zls.setup({})
  require('lspconfig').vimls.setup({})
  require('lspconfig').lua_ls.setup({})
  require('lspconfig').pylsp.setup({})
  require('lspconfig').dotls.setup({})
  require('lspconfig').sqls.setup({})

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
  -- Autoformat
  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end)
-- Defer loading anything that can be
later(function()
  -- Trouble
  add({
    source = 'folke/trouble.nvim'
  })
  -- Asciidoctor
  add({
    source = 'habamax/vim-asciidoctor'
  })
  -- Signatures
  add({
    source = 'folke/neodev.nvim'
  })
  -- Lua Snip
  add({
    source = 'L3MON4D3/LuaSnip'
  })

  -- Dap
  add({
    source = 'rcarriga/nvim-dap-ui',
    depends = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    }
  })
  -- Which key
  add({
    source = 'folke/which-key.nvim'
  })

  require('which-key').setup()
  map('n', '?', '<cmd>WhichKey<cr>')

  -- Telescope
  add({
    source = 'nvim-telescope/telescope.nvim',
    depends = {
      'nvim-lua/plenary.nvim',
    }
  })

  -- Telescope
  -- See `:help telescope.builtin`
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

  require('trouble').setup()

  -- Run gofmt + goimports on save
  local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
      require('go.format').goimports()
    end,
    group = format_sync_grp,
  })
  -- Keymapping
  map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
  map('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
  map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
  map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
  map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
  map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
  map('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
  map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
  map('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    map('n', keys, func, { desc = desc })
  end


  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')


end)