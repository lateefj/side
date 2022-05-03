local helper = require('helper')

local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'set ts=2 sts=2 sw=2'
cmd 'filetype plugin indent on'


helper.BUFFER.tabstop = indent
helper.BUFFER.expandtab = true
helper.BUFFER.shiftwidth = indent
helper.BUFFER.expandtab = true
helper.BUFFER.autoindent = true
helper.WINDOW.number = true

-- Termguicolosrs
vim.o.termguicolors = true
-- Wrap text
helper.BUFFER.wrap = true

if helper.TMUX == '' then
    cmd 'set clipboard+=unnamed'
end

-- cmd 'set spell spelllang=en_us'

-- Set default super tab
helper.GLOBAL.SuperTabDefaultCompletionType = '<c-n>'


cmd 'set t_Co=256'

-- Highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

helper.map(helper.MODE.NMAP, '<leader><Space>', ':set hlsearch!<CR>', { noremap = true, silent = true})


