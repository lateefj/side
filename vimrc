
let s:uname = substitute(system('uname'), "\n", "", "")
set noeb vb t_vb=

set nocompatible              " be iMproved, required
set hidden
filetype off                  " required

" Tab settings 4 spaces means more code
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent 

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
map <leader>x :wincmd c<CR>
map <leader>s :wincmd s<CR>
map <leader>v :wincmd v<CR>
map <leader>e :wincmd =<CR>
map <C-j> :wincmd <<CR>
map <C-l> :wincmd ><CR>

" Go one screen line down instead of an next end of line caracter
nmap j gj
nmap k gk

" Wrap text
set wrap

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

" Plugins that don't have special configuration with them
call plug#begin('~/.vim/plugged')
syntax enable
filetype plugin on
filetype plugin indent on    " required

" Spelling!
set spell spelllang=en_us

" fzf fuzzy search matching 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


"NERDTree
Plug 'scrooloose/nerdtree'
" NERDTree ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Git nerdTree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Rust
Plug 'rust-lang/rust.vim'

" Lua
Plug 'xolox/vim-lua-ftplugin'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Restructured Text
Plug 'Rykka/riv.vim'

" Markdown setup thanks to: https://josh.blog/2017/04/writing-mode-vim
" Markdown Highlights 
Plug 'tpope/vim-markdown'

" Misc for lua
Plug 'xolox/vim-misc'

" End quoates ect
Plug 'Raimondi/delimitMate'

" Git gutter
Plug 'airblade/vim-gitgutter'

" Fish shell
Plug 'dag/vim-fish'

" Awk
Plug 'vim-scripts/awk.vim'

" Go
Plug 'fatih/vim-go'

" 120 languages
Plug 'sheerun/vim-polyglot'

" Color scheme is great
Plug 'NLKNguyen/papercolor-theme'

"Super tab
Plug 'ervandew/supertab' 

" SCSS
Plug 'cakebaker/scss-syntax.vim'

" C
" Clang complete
" Plug 'Rip-Rip/clang_complete'
Plug 'justmao945/vim-clang'

let side_vimplug=$HOME . '/.side/vimplug'
if !empty(glob(side_vimplug)) " Not sure but can't seem to use the variable in the source command 
	source $HOME/.side/vimplug 
endif


call plug#end()

" C library path
if has("unix")
  let g:clang_c_options = '-std=gnu11'
  if s:uname == "Darwin"
    let g:clang_library_path='/usr/local/opt/llvm/lib'
  elseif s:uname == "FreeBSD"
    let g:clang_library_path='/usr/local/llvm-devel/lib'
  endif
endif


let g:airline_theme='papercolor'
let g:lightline = { 'colorscheme': 'PaperColor' }

" Clang configuration
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1



colo PaperColor
" fzf search configuration
nmap <F9> <Esc>:FZF<CR>
nmap <C-P> <Esc>:FZF<CR>
" Tag Bar Toggle
nmap <C-T> <Esc>:FZF<CR>
nnoremap <leader>/ :FZF<CR>

" Go  config

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

" Go shortcuts
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
" Identifier under the cursor
autocmd FileType go nmap <Leader>i <Plug>(go-info)<Paste>


" Extend vim via config file
let side_vimrc=$HOME . '/.side/vimrc'
if !empty(glob(side_vimrc)) " Not sure but can't seem to use the variable in the source command 
	source $HOME/.side/vimrc 
endif
