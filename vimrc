" Vim doesn't work with fish yet
"
if $SHELL =~ 'fish'
  set shell=/bin/bash
endif

" Turn the error bell off!!
set noeb vb t_vb=

set nocompatible              " be iMproved, required
set hidden
filetype off                  " required

"Less temp files
set backupdir=~/.vim/backup_files//
set directory=~/.vim/swap_files//
set undodir=~/.vim/undo_files//

set splitright
let mapleader = ","

" ex mode is not a place I want to be
nnoremap Q <nop>

" Window short cuts
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
map <leader>c :wincmd c<CR>
map <leader>s :wincmd s<CR>
map <leader>v :wincmd v<CR>
map <leader>e :wincmd =<CR>
map <C-j> :wincmd <<CR>
map <C-l> :wincmd ><CR>

" Go one screen line down instead of an next end of line caracter
nmap j gj
nmap k gk

" Json format alias
command Jsonify %!python -m json.tool

" Line number on
set number
" Fix alt key mapping for chromebooks
imap ≥ =>

" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>

" Wrap text
set wrap
" Tab settings 4 spaces means more code
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent 

" When building it automatically write the contents of a file
set autowrite

" 2 esc to stop search
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
" Copy Paste clipboard 
if system('uname -s') == "Darwin\n"
  "OSX
  set clipboard=unnamed 
else
  "Linux
  set clipboard=unnamedplus
endif

" Show status bar always
set laststatus=2

syntax enable
set background=dark
filetype plugin on
filetype plugin indent on    " required
set nofoldenable

" Spelling!
set spell spelllang=en_us

" Plugins that don't have special configuration with them
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
" DelimitMage auto close tabes and quaots ect
"Plug 'Raimondi/delimitMate.git'

" Ctrl -P
Plug 'ctrlpvim/ctrlp.vim'

" fzf fuzzy search matching 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Plug 'jlanzarotta/bufexplorer'

"Syntastic
Plug 'scrooloose/syntastic'

" Unit outline
Plug 'h1mesuke/unite-outline'

" Neo make
Plug 'neomake/neomake'

" Define your own operator
Plug 'kana/vim-operator-user'

Plug 'bling/vim-airline'
"let g:airline#extensions#tabline#enabled = 1

"NERDTree
Plug 'scrooloose/nerdtree'
" NERDTree ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Git nerdTree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" C
Plug 'vim-scripts/c.vim'

" Ada 
Plug 'vim-scripts/Ada-Bundle'

" Rust
Plug 'rust-lang/rust.vim'

" Lua
Plug 'xolox/vim-lua-ftplugin'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Python
Plug 'davidhalter/jedi-vim'

" Restructured Text
Plug 'Rykka/riv.vim'

" Nim 
Plug 'baabelfish/nvim-nim'

" Markdown setup thanks to: https://josh.blog/2017/04/writing-mode-vim
" Markdown Highlights 
Plug 'tpope/vim-markdown'

" Cython
Plug 'tshirtman/vim-cython'
au BufRead,BufNewFile *.pxd,*.pxi,*.pyx set filetype=pyrex


" Javascript
Plug 'pangloss/vim-javascript'

" Misc for lua
Plug 'xolox/vim-misc'

" csv
Plug 'chrisbra/csv.vim'

" End quoates ect
Plug 'Raimondi/delimitMate'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Virtualenv
Plug 'jmcantrell/vim-virtualenv'


" Vagrant
Plug 'markcornick/vim-vagrant'

Plug 'Shougo/vimproc.vim'
Plug 'junegunn/vader.vim'

Plug 'junegunn/vim-emoji' " Requires vader

" seoul256
Plug 'junegunn/seoul256.vim'
" Solarized
" Plug 'altercation/vim-colors-solarized'


" Fish shell
Plug 'dag/vim-fish'

" Go
Plug 'fatih/vim-go'
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
nnoremap <leader>f :cnext<CR>
nnoremap <leader>b :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Way to automatically split
Plug 'AndrewRadev/splitjoin.vim'

" Highlighter
Plug 'junegunn/limelight.vim'
" Mark down editor
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd! User goyo.vim echom 'Goyo is now loaded!'

" Neocomplete
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neobundle.vim'
call plug#end()


colo seoul256
hi Normal ctermbg=NONE

" Go  config
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
" Nicer highlights
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" Checkers
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" Lint on save
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', ]
let g:go_metalinter_deadline = "5s"
" Go shortcuts
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>C <Plug>(go-coverage-toggle)


" Set up :make to use fish for syntax checking.
compiler fish

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Goyo
function! s:auto_goyo()
    if &ft == 'markdown' && winnr('$') == 1
        Goyo 70%
    elseif exists('#goyo')
        Goyo!
    endif
endfunction

function! s:goyo_leave()
    if winnr('$') < 2
        silent! :q
    endif
endfunction

augroup goyo_markdown
    autocmd!
    autocmd BufNewFile,BufRead * call s:auto_goyo()
    autocmd! User GoyoLeave nested call s:goyo_leave()
augroup END



" Neocomplete

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

if has("gui_running")
  set background=dark
  set guioptions-=T         " Remove toolbar
  if has("gui_gtk2")
    "set guifont=Consolas\ 10
  elseif has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    set guifont=Monaco:h16
    set fu
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" Extend vim via config file
let side_vimrc=$HOME . '/.side/vimrc'
if !empty(glob(side_vimrc)) " Not sure but can't seem to use the variable in the source command 
	source $HOME/.side/vimrc 
endif
