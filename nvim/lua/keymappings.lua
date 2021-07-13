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
helper.map(helper.MODE.NMAP, '<C-j>', ':wincmd <<CR>')
helper.map(helper.MODE.NMAP, '<C-l>', ':wincmd ><CR>')

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
helper.map(helper.MODE.NAMP, '<C-T>', '<Esc>:FZF<CR>')
helper.map(helper.MODE.MAP, '<leader>p', ':FZF<CR>', { noremap = true})


-- Go shortcuts
cmd 'autocmd FileType go nmap <leader>b <Plug>(go-build)'
cmd 'autocmd FileType go nmap <leader>r <Plug>(go-run)'
cmd 'autocmd FileType go nmap <leader>t <Plug>(go-test)'
cmd 'autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)'
-- Identifier under the cursor
cmd 'autocmd FileType go nmap <Leader>i <Plug>(go-info)<Paste>'
