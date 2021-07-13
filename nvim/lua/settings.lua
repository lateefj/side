local helper = require('helper')

local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'


helper.BUFFER.tabstop = indent
helper.BUFFER.expandtab = true
helper.BUFFER.shiftwidth = indent
helper.BUFFER.expandtab = true
helper.BUFFER.autoindent = true
helper.WINDOW.number = true

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
