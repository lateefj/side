	local helper = require('helper')

helper.map(helper.MODE.MAP, 'Q', '<nop>', { noremap = true})
-- Window management mapping
helper.map(helper.MODE.NMAP, '<leader>h', ':wincmd h<CR>')
helper.map(helper.MODE.NMAP, '<leader>j', ':wincmd j<CR>')
helper.map(helper.MODE.NMAP, '<leader>k', ':wincmd k<CR>')
helper.map(helper.MODE.NMAP, '<leader>l', ':wincmd l<CR>')
helper.map(helper.MODE.NMAP, '<leader>x', ':wincmd c<CR>')
helper.map(helper.MODE.NMAP, '<leader>s', ':wincmd s<CR>')
helper.map(helper.MODE.NMAP, '<leader>v', ':wincmd v<CR>')
helper.map(helper.MODE.NMAP, '<leader>e', ':wincmd =<CR>')
helper.map(helper.MODE.NMAP, '>', '<C-W>>')
helper.map(helper.MODE.NMAP, '<', '<C-W><')
helper.map(helper.MODE.NMAP, '-', ':resize -1<CR>')
helper.map(helper.MODE.NMAP, '+', ':resize +1<CR>')

-- Go one screen line down instead of an next end of line character
helper.map(helper.MODE.NMAP, 'j', 'gj')
helper.map(helper.MODE.NMAP, 'k', 'gk')

helper.map(helper.MODE.MAP, '<C-l>', '<cmd>noh<CR>') -- Clear highlights
helper.map(helper.MODE.IMAP, 'jk', '<Esc>')           -- jk to escape

-- Tagbar Toggle
helper.map(helper.MODE.NMAP, '<F8>', ':TagbarToggle<CR>')
-- Rip Grep
helper.GLOBAL.rg_command = 'rg --vimgrep -S'

helper.map(helper.MODE.MAP, '<leader>/', ':Rg<Cr>', { noremap = true})


-- fzf search configuration
helper.map(helper.MODE.NMAP, '<F9>', '<Esc>:FZF<CR>')
helper.map(helper.MODE.NMAP, '<C-P>', '<Esc>:FZF<CR>')
-- Tag Bar Toggle
helper.map(helper.MODE.NMAP, '<C-T>', '<Esc>:FZF<CR>')
helper.map(helper.MODE.MAP, '<leader>p', ':FZF<CR>', { noremap = true})


-- Telescope
helper.map(helper.MODE.MAP, '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true})
helper.map(helper.MODE.MAP, '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true})
helper.map(helper.MODE.MAP, '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true})
helper.map(helper.MODE.MAP, '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true})
-- Go shortcuts
vim.cmd 'autocmd FileType go nmap <leader>b <Plug>(go-build)'
vim.cmd 'autocmd FileType go nmap <leader>r <Plug>(go-run)'
vim.cmd 'autocmd FileType go nmap <leader>t <Plug>(go-test)'
vim.cmd 'autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)'
-- Identifier under the cursor
vim.cmd 'autocmd FileType go nmap <Leader>i <Plug>(go-info)<Paste>'
