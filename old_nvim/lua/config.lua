local helper = require("helper")

vim.o.background = "dark" -- dark or "light" for light mode
-- vim.g.everforest_background = 'soft'
-- vim.cmd([[colorscheme apprentice]])
--vim.cmd([[colorscheme gruvbox-material]])
--vim.g.everforest_better_performance = 1
-- vim.cmd([[colorscheme everforest]])
-- vim.cmd([[colorscheme gruvbox-material]])
-- vim.cmd([[colorscheme gruvbox]])

vim.cmd([[colorscheme onedark]])

-- Copy with: "*y
vim.o.clipboard = "unnamed"

-- Autospell check document
vim.cmd([[autocmd BufRead,BufNewFile *.adoc setlocal spell]])
vim.cmd([[autocmd BufRead,BufNewFile *.md setlocal spell]])

--[[ Configure completion ]]
--
-- LSP config (the mappings used in the default file don't quite work right)
helper.map(helper.MODE.NMAP, "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
helper.map(helper.MODE.NMAP, "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
helper.map(helper.MODE.NMAP, "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
helper.map(helper.MODE.NMAP, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
helper.map(helper.MODE.NMAP, "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
helper.map(helper.MODE.NMAP, "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
helper.map(helper.MODE.NMAP, "<C-n>", "<cmd>lua vim.lsp.buf.goto_prev()<CR>", { noremap = true, silent = true })
helper.map(helper.MODE.NMAP, "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
vim.cmd([[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)]])

vim.o.completeopt = "menuone,noselect"

local function word_count()
	return tostring(vim.fn.wordcount().words)
end

require("onedark").setup()
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename", word_count },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

vim.g.go_list_type = "quickfix"

require("compe").setup({
	enabled = true,
	autocomplete = true,
	debug = false,
	min_length = 1,
	preselect = "enable",
	throttle_time = 80,
	source_timeout = 200,
	incomplete_delay = 400,
	max_abbr_width = 100,
	max_kind_width = 100,
	max_menu_width = 100,
	documentation = false,

	source = {
		path = true,
		buffer = true,
		calc = true,
		vsnip = true,
		nvim_lsp = true,
		nvim_lua = true,
		spell = true,
		tags = true,
		snippets_nvim = true,
		treesitter = true,
	},
})
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prevcnext snippet's placeholder
_G.tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-n>")
	elseif vim.fn.call("vsnip#available", { 1 }) == 1 then
		return t("<Plug>(vsnip-expand-or-jump)")
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["compe#complete"]()
	end
end
_G.s_tab_complete = function()
	if vim.fn.pumvisible() == 1 then
		return t("<C-p>")
	elseif vim.fn.call("vsnip#jumpable", { -1 }) == 1 then
		return t("<Plug>(vsnip-jump-prev)")
	else
		-- If <S-Tab> is not working in your terminal, change it to <C-h>
		return t("<S-Tab>")
	end
end
-- Clangd
require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "lazyvim.plugins.extras.lang.clangd" },
		{ import = "plugins" },
	},
})
-- Zig
require("lspconfig").zls.setup({})

-- Go
require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "lazyvim.plugins.extras.lang.go" },
		{ import = "plugins" },
	},
})
-- Python
require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "plugins" },
	},
})
-- Bash
require("lspconfig").bashls.setup({})
-- SQL
require("lspconfig").sqls.setup({
	picker = "telescope",
	on_attach = function(client)
		client.resolved_capabilities.execute_command = true
		require("sqls").setup({})
	end,
})

require("lspkind").init({})