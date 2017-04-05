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

" fzf fuzzy search matching 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Plug 'jlanzarotta/bufexplorer'

"Syntastic
Plug 'scrooloose/syntastic'

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

" Git gutter
Plug 'airblade/vim-gitgutter'

" Virtualenv
Plug 'jmcantrell/vim-virtualenv'


" Vagrant
Plug 'markcornick/vim-vagrant'

" Neocomplete
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neocomplcache.vim'
Plug 'Shougo/neobundle.vim'

Plug 'Shougo/vimproc.vim'
Plug 'junegunn/vader.vim'

Plug 'junegunn/vim-emoji' " Requires vader
call plug#end()


call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
call plug#end()
if has('gui_running')
else 
  " 256 colors
  set t_Co=256 
  let g:solarized_termcolors=256
endif
colorscheme solarized
" Plug 'nanotech/jellybeans.vim'
" colorscheme jellybeans
" Plug 'vim-scripts/moria'
" let moria_monochrome = 1
" colorscheme moria

hi Normal ctermbg=NONE



" Fish shell
call plug#begin('~/.vim/plugged')
Plug 'dag/vim-fish'
call plug#end()
" Set up :make to use fish for syntax checking.
compiler fish


" Go
call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
call plug#end()

" au BufRead,BufNewFile *.go set filetype=go
"let g:go_snippet_engine = "neosnippet"


" Enable parsing features
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Syntatic integration
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
" Go related mappings
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>i <Plug>(go-info)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
call plug#end()
autocmd! User goyo.vim echom 'Goyo is now loaded!'

" Goyo
function! s:auto_goyo()
    if &ft == 'markdown' && winnr('$') == 1
        Goyo 80
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




"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plug key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

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
