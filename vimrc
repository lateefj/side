
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

" Go one screen line down instead of an next end of line character
nmap j gj
nmap k gk

" Wrap text
set wrap

" Transparent background
let t:is_transparent = 0                                                                        
function! Toggle_transparent_background()                                                       
  if t:is_transparent == -1                                                                      
    hi Normal guibg=#111111 ctermbg=black                                                       
    let t:is_transparent = 1                                                                    
  else                                                                                          
    hi Normal guibg=NONE ctermbg=NONE                                                           
    let t:is_transparent = 0                                                                    
  endif                                                                                         
endfunction                                                                                     
nnoremap <C-x><C-t> :call Toggle_transparent_background()<CR>  

" Copy Paste clipboard 
if $TMUX == ''
  set clipboard+=unnamed
elseif s:uname == "Darwin\n"
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

Plug 'sainnhe/edge'

" Go plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" 120 languages
Plug 'sheerun/vim-polyglot'

" Fish shell
Plug 'dag/vim-fish'

" Awk
Plug 'vim-scripts/awk.vim'


"Super tab
Plug 'ervandew/supertab' 

" SCSS
Plug 'cakebaker/scss-syntax.vim'

" C
" Clang complete
" Plug 'Rip-Rip/clang_complete'
Plug 'justmao945/vim-clang'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Prolog
Plug 'soli/prolog-vim'

" Dart
Plug 'natebosch/vim-lsc'

" Color scheme
Plug 'lifepillar/vim-solarized8'

" Zig
Plug 'ziglang/zig.vim'



let side_vimplug=$HOME . '/.side/vimplug'
if !empty(glob(side_vimplug)) " Not sure but can't seem to use the variable in the source command 
	source $HOME/.side/vimplug 
endif


call plug#end()


" Set default super tab
let g:SuperTabDefaultCompletionType = "<c-n>"

" C library path
if has("unix")
  let g:clang_c_options = '-std=gnu11'
  if s:uname == "Darwin"
    let g:clang_library_path='/usr/local/opt/llvm/lib'
  elseif s:uname == "FreeBSD"
    let g:clang_library_path='/usr/local/llvm-devel/lib'
  endif
endif


" Clang configuration
let g:clang_user_options='|| exit 0'
let g:clang_complete_auto = 1
let g:clang_complete_copen = 1

" Dart language server
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:lsc_auto_map = v:true
let g:lsc_auto_map = {
    \ 'GoToDefinition': ['gd', '<C-]>'],
    \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
    \ 'FindReferences': 'gr',
    \ 'NextReference': 'C-n>',
    \ 'PreviousReference': '<C-p>',
    \ 'FindImplementations': 'gI',
    \ 'FindCodeActions': 'ga',
    \ 'Rename': 'gR',
    \ 'ShowHover': v:true,
    \ 'DocumentSymbol': 'go',
    \ 'WorkspaceSymbol': 'gS',
    \ 'SignatureHelp': 'gm',
    \ 'Completion': 'completefunc',
    \}



set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
if (has("termguicolors"))
  set termguicolors
endif

colo solarized8
set t_Co=256




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

let g:go_highlight_types = 1
" let g:go_metalinter_autosave = 1
let g:go_fmt_autosave = 1
let g:go_metalinter_enabled = ['vet', 'errcheck']
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"


set autowrite


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
