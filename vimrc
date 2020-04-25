
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

syntax enable
filetype plugin on
filetype plugin indent on    " required

" Spelling!
set spell spelllang=en_us

" Plugins that don't have special configuration with them
call plug#begin('~/.vim/plugged')

" Deoplete 
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:python_host_skip_check = 1
  let g:python3_host_skip_check = 1
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" let g:pyenv_host_prog = '/usr/local/bin/pyenv'
if has('python3')                                                                                                 
  " set pyxversion=3
endif
if has('pythonx')
	set pyxversion=3
endif
Plug 'tpope/vim-fugitive'

" Tag bar
Plug 'majutsushi/tagbar'
" Version control thing
Plug 'airblade/vim-rooter'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" fzf fuzzy search matching 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


"NERDTree
Plug 'scrooloose/nerdtree'
" NERDTree ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Git nerdTree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Pyenv
Plug 'lambdalisue/vim-pyenv'

" Vagrant
Plug 'markcornick/vim-vagrant'

Plug 'Shougo/vimproc.vim'
Plug 'junegunn/vader.vim'

Plug 'junegunn/vim-emoji' " Requires vader
" Color scheme is great
" Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/edge'
" New Solarized8 
"Plug 'lifepillar/vim-solarized8'
" Plug 'fatih/molokai'
if has("unix")
  if s:uname == "FreeBSD"
    " For future reference
  else
    " Solarized
    "Plug 'altercation/vim-colors-solarized'
  endif
endif

" 120 languages
Plug 'sheerun/vim-polyglot'

" Fish shell
" Plug 'dag/vim-fish'

" Awk
Plug 'vim-scripts/awk.vim'


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


set termguicolors

let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1
let g:airline_theme = 'edge'
let g:lightline = {'colorscheme' : 'edge'}

colo edge


" fzf search configuration
nmap <F9> <Esc>:FZF<CR>
nmap <C-P> <Esc>:FZF<CR>
" Tag Bar Toggle
nmap <C-T> <Esc>:FZF<CR>
nnoremap <leader>/ :FZF<CR>


" Go shortcuts
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
" Identifier under the cursor
autocmd FileType go nmap <Leader>i <Plug>(go-info)<Paste>


nnoremap <leader>f :cnext<CR>
nnoremap <leader>b :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Set up :make to use fish for syntax checking.
compiler fish

" Markdown preview
nmap <C-s> <Plug>MarkdownPreview

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
