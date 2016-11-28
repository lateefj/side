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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" All of your Plugins must be added before the following line
call vundle#end()            " required

" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


if has('gui_running')
else 
  " 256 colors
  set t_Co=256 
  let g:solarized_termcolors=256
endif

Plugin 'altercation/vim-colors-solarized'
colorscheme solarized
" Plugin 'nanotech/jellybeans.vim'
" colorscheme jellybeans

hi Normal ctermbg=NONE


" Fish shell
Plugin 'dag/vim-fish'
" Set up :make to use fish for syntax checking.
compiler fish

" DelimitMage auto close tabes and quaots ect
Plugin 'Raimondi/delimitMate.git'


" Plugin 'jlanzarotta/bufexplorer'


Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

"Syntastic
Plugin 'scrooloose/syntastic'

"NERDTree
Plugin 'scrooloose/nerdtree'

" NERDTree git plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" NERDTree ctrl-n
map <C-n> :NERDTreeToggle<CR>

" C
Plugin 'vim-scripts/c.vim'

" Ada 
Plugin 'vim-scripts/Ada-Bundle'

" Go
Plugin 'fatih/vim-go'

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
" Rust
Plugin 'rust-lang/rust.vim'

" Lua
Plugin 'xolox/vim-lua-ftplugin'

" Nim
Plugin 'zah/nimrod.vim'
au BufRead,BufNewFile *.nim set filetype=nim
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" Dart
" https://github.com/dart-lang/dart-vim-plugin
Plugin 'dart-lang/dart-vim-plugin'
au BufRead,BufNewFile *.dart set filetype=dart
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/dart-vim-plugin
endif
filetype plugin indent on

" Python
Plugin 'klen/python-mode'

" Cython
Plugin 'tshirtman/vim-cython'
au BufRead,BufNewFile *.pxd,*.pxi,*.pyx set filetype=pyrex

" Restructured Text
Plugin 'Rykka/riv.vim'

" Javascript
Plugin 'pangloss/vim-javascript'
" Polymer
Plugin 'bendavis78/vim-polymer'

" Misc for lua
Plugin 'xolox/vim-misc'

" Sessions 
Plugin 'xolox/vim-session'
" Turn on session autoload already!!
let g:session_autoload = 1
let g:session_autosave = 1
let g:sesson_autosave_periodic = 1
let g:session_autosave = 'no'

" csv
Plugin 'chrisbra/csv.vim'

" Git gutter
Plugin 'airblade/vim-gitgutter'

" Virtualenv
Plugin 'jmcantrell/vim-virtualenv'


" Vagrant
Plugin 'markcornick/vim-vagrant'

" Neocomplete
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Shougo/neobundle.vim'

Plugin 'Shougo/vimproc.vim'

Plugin 'junegunn/vader.vim'

Plugin 'junegunn/vim-emoji' " Requires vader
"let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
"let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
"let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
"let g:gitgutter_sign_modified_removed = emoji#for('collision')
"set completefunc=emoji#complete

if system('uname -o') =~ '^GNU/'
  let g:make = 'make'
endif
" Replacement for ctrlp
Plugin 'Shougo/unite.vim'
nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <space><space> :Unite file_rec/async<cr>
nnoremap <space>/ :Unite grep:.<cr>
"Plugin 'rking/ag.vim'
"let g:unite_source_rec_async_command =
            \ 'ag --follow --nocolor --nogroup --hidden -g ""'


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

" Plugin key-mappings.
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
let g:side_vimrc = $HOME . '/.side/vimrc'
if filereadable(!empty(glob(side_vimrc)))
  source side_vimrc
endif

