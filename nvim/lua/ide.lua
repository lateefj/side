local map = vim.keymap.set
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/onsails/lspkind.nvim',
	'https://git.sr.ht/~lhj/spoon',-- My first vim plugin for session managers
	'https://github.com/nickeb96/fish.vim', -- Fish
	'https://github.com/vim-scripts/awk.vim', -- Awk
	'https://github.com/justmao945/vim-clang',-- Clang
	'https://github.com/ziglang/zig.vim',-- Zig
	'https://github.com/folke/trouble.nvim', -- Trouble
})
-- Zero configuration
-- vim.pack.add({ {src = 'https://github.com/VonHeikemen/lsp-zero.nvim', version = 'v4.x' }})
-- Autocomplete
vim.pack.add({
	'https://github.com/hrsh7th/cmp-nvim-lsp',
	'https://github.com/hrsh7th/cmp-buffer',
	'https://github.com/onsails/lspkind.nvim',
	'https://github.com/hrsh7th/nvim-cmp',
})

-- Go
vim.pack.add(
	{
		"https://github.com/ray-x/guihua.lua",
		"https://github.com/neovim/nvim-lspconfig",
		'https://github.com/ray-x/go.nvim',
	},
	{
		--load = function() require("go.install").update_all_sync() end,
	}
)
-- Navigator
vim.pack.add({
	'https://github.com/ray-x/guihua.lua',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/ray-x/navigator.lua',
})

-- Floating terminal
vim.pack.add({
	'https://github.com/voldikss/vim-floaterm'
})


vim.lsp.enable('awk_lsp')
vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('dotls')
vim.lsp.enable('gopls')
vim.lsp.enable('luals')
vim.lsp.enable('postgres_lsp')
vim.lsp.enable('pylsp')
vim.lsp.enable('ruby_lsp')
vim.lsp.enable('zls')


vim.diagnostic.config({
	virtual_lines = true,
	-- virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})


-- Go setup
require("go").setup()


local cmp = require("cmp")
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

vim.pack.add({
	'https://github.com/habamax/vim-asciidoctor',-- Asciidoctor
	'https://github.com/folke/neodev.nvim', -- Signatures
	'https://github.com/L3MON4D3/LuaSnip', -- Lua Snip
	'https://github.com/folke/which-key.nvim', -- Which key
})
-- Dap
vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/nvim-neotest/nvim-nio",
	'https://github.com/rcarriga/nvim-dap-ui',
})

require('which-key').setup()
map('n', '?', '<cmd>WhichKey<cr>')

-- Telescope
vim.pack.add({
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/nvim-telescope/telescope.nvim',
})

-- Setting up first plugin
require('spoon').setup()
vim.keymap.set('n', '<leader>sn', '<cmd>SpoonNew<cr>')
vim.keymap.set('n', '<leader>ss', '<cmd>SpoonSave<cr>')
vim.keymap.set('n', '<leader>sw', '<cmd>SpoonSwitch<cr>')

require('trouble').setup()
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
-- map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
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
