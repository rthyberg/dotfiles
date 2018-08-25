call plug#begin('~/.config/nvim/plugged')
        " Colors
        Plug 'chriskempson/base16-vim'
        Plug 'lilydjwg/colorizer'
        " Util
        Plug 'vim-scripts/StripWhiteSpaces'
        Plug 'scrooloose/nerdtree'
        " Code Compeletion
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        Plug 'zchee/deoplete-clang'
        Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
        Plug 'zchee/deoplete-go', { 'do': 'make'}
        Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
        Plug 'zchee/deoplete-jedi'
        Plug 'sebastianmarkow/deoplete-rust'
call plug#end()

""" Base16-git helper
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
"
""" Color Schemes
"set background=dark
set termguicolors   " use term colors
colorscheme base16-harmonic-dark
""" Syntax
syntax enable " enable syntax processing
hi Normal guibg=NONE ctermbg=NONE " set background to transparent

""" Tab settings
set tabstop=4 " number of visual spaces per tab
set softtabstop=4 " number of spaces in a tab when editing
set expandtab      " tabs are spaces

""" UI config
set number " show line numbers
set showcmd "show last command  used for powerline plugin
"set cursorline "highlught current line
""" Nerd-Tree
" bind nerdtree to ctrl-n
map <C-n> :NERDTreeToggle<CR>
" close nerdtree if only open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" Python bins
" Neovim requires Python paths
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

""" Code formating
filetype indent on "load filetpe-specific indent files
"set wildmenu "visual autocomplete for command menu
set lazyredraw "only redraw when need to.. Faster macros
"set showmatch "higlight matching [{()}]
"
""" Searching
set incsearch "search as characters are entered
set hlsearch "highlight matchs
nnoremap <leader><space> :nohlsearch<CR>
set foldenable "enable folding
set foldlevelstart=10 "open most fold by default
set foldnestmax=10 "10 nexted fold max
 "space open/closes folds
nnoremap <space> za
set foldmethod=indent "fold based on indent level

""" Trailing whitespace
let g:strip_trailing_lines = 1

""" Code Compeletion
let g:deoplete#enable_at_startup = 1
set completeopt-=preview "no scrach pad
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>" " deoplete tab-complete
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>" " reverse tab-complete

""" C Family
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so' " clanglib for deoplete
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang' " Clang headers

""" TernJS

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for
" properties) between the completions and the origin position in the result
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some
" heuristics to try and return some properties anyway. Set this to 0 to
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0


"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]

""" Rust Racer
" set rust src
let g:deoplete#sources#rust#rust_source_path='/home/rthyberg/.config/rustsrc/rust/src'
" show duplicate matches
let g:deoplete#sources#rust#show_duplicates=1
" disable default key mappings (gd & K)   current=enabled
let g:deoplete#sources#rust#disable_keymap=0
" set max height of documentation split
let g:deoplete#sources#rust#documentation_max_height=20

""" HTML
" set tabs to 2 spaces for html
autocmd Filetype html setlocal ts=2 sts=2 sw=2
