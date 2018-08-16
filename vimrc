" Vim doesn't work with fish yet
"
if $SHELL =~ 'fish'
  set shell=/bin/bash
endif

let s:uname = substitute(system('uname'), "\n", "", "")
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
if $TMUX == ''
  set clipboard+=unnamed
elseif system('uname -s') == "Darwin\n"
  "OSX
  set clipboard=unnamed 
else
  "Linux
  set clipboard=unnamedplus
endif

" Show status bar always
set laststatus=2

syntax enable
filetype plugin on
filetype plugin indent on    " required

set nofoldenable    " disable folding

" Spelling!
set spell spelllang=en_us

" Plugins that don't have special configuration with them
call plug#begin('~/.vim/plugged')
" Deoplete 
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'tpope/vim-fugitive'

" Search
Plug 'Shougo/denite.nvim'
" Tag bar
Plug 'majutsushi/tagbar'
" Version control thing
Plug 'airblade/vim-rooter'
" Markdown
Plug 'gabrielelana/vim-markdown'
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

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"NERDTree
Plug 'scrooloose/nerdtree'
" NERDTree ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Git nerdTree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" C
" Plug 'vim-scripts/c.vim'
" Clang complete
Plug 'Rip-Rip/clang_complete'

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

" Zig
Plug 'andrewrk/zig.vim'

" Nim 
Plug 'zah/nim.vim'

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

" Pyenv
Plug 'lambdalisue/vim-pyenv'


" Vagrant
Plug 'markcornick/vim-vagrant'

Plug 'Shougo/vimproc.vim'
Plug 'junegunn/vader.vim'

Plug 'junegunn/vim-emoji' " Requires vader
" Color scheme is great
Plug 'NLKNguyen/papercolor-theme'
if has("unix")
  if s:uname == "FreeBSD"
    " For future reference
  else
    " Solarized
    "Plug 'altercation/vim-colors-solarized'
  endif
endif
" Plug 'fneu/breezy'

" Plug 'nanotech/jellybeans.vim'

"Plug 'itchyny/lightline.vim'

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

let side_vimplug=$HOME . '/.side/vimplug'
if !empty(glob(side_vimplug)) " Not sure but can't seem to use the variable in the source command 
	source $HOME/.side/vimplug 
endif



call plug#end()

" C library path
if has("unix")
  if s:uname == "Darwin"
    let g:clang_library_path='/usr/local/opt/llvm/lib'
  elseif s:uname == "FreeBSD"
    let g:clang_library_path='/usr/local/llvm-devel/lib'
  endif
endif



colo PaperColor
let g:airline_theme='papercolor'
let g:lightline = { 'colorscheme': 'PaperColor' }

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

hi Normal ctermbg=NONE

" Search Denite
nmap <F9> <Esc>:Denite file_rec<CR>
nmap <C-P> <Esc>:Denite file_rec<CR>
" Tag Bar Toggle
nmap <C-T> <Esc>:TagbarToggle<CR>

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


" Neocomplete

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
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"



if has("gui_running")
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
else
  " place holder
endif

if has("unix")
  if s:uname == "FreeBSD"
    set background=dark
  else
    set background=dark
  endif
endif

" Extend vim via config file
let side_vimrc=$HOME . '/.side/vimrc'
if !empty(glob(side_vimrc)) " Not sure but can't seem to use the variable in the source command 
	source $HOME/.side/vimrc 
endif
