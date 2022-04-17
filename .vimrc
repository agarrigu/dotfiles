" Big stuff
filetype plugin indent on     
set hidden
set nocompatible
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set updatetime=100
set encoding=utf-8

" Display and metadata
syntax on
set background=dark
set colorcolumn=80
set cmdheight=1
set conceallevel=0
set cursorline
set laststatus=2
set linebreak
set list
set listchars=tab:\ \ ,trail:·
set number
set relativenumber
set ruler
set showmatch
set scrolloff=8
set signcolumn=yes
set wildmenu
set wrap

" Navigation and editig
set backspace=indent,eol,start
set foldmethod=syntax
set foldlevel=99

" Indentation
set autoindent
set smartindent

" Prety
colorscheme molokai

" Searches
set hlsearch
set incsearch
set ignorecase
set showmatch
set smartcase

" Tabs and Spaces
set shiftwidth=4
set smarttab
set softtabstop=0
set tabstop=4
" set expandtab

" MY REMAPS
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader>w :w<CR> 
nnoremap <ESC> :let@/=""<CR>
nnoremap <leader>rr :set relativenumber!<cr>

inoremap kj <esc> 
inoremap kj <esc> 

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

map q: <nop>
nnoremap Q <nop>

" PLUGINS!

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

" Aesthetics and metadata stuff
Plug 'vim-airline/vim-airline'

" Editing stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-sort-motion'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Navigation stuff
Plug 'christoomey/vim-tmux-navigator'

" Syntax stuff
Plug 'vim-syntastic/syntastic'
Plug 'bfrg/vim-cpp-modern'
Plug 'jayli/vim-easycomplete'
Plug 'honza/vim-snippets'
" Plug 'alexandregv/norminette-vim'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'vim-scripts/argtextobj.vim'
Plug 'mattn/vim-textobj-url'
Plug 'Julian/vim-textobj-variable-segment'
Plug 'adolenc/vim-textobj-toplevel'
Plug 'D4KU/vim-textobj-chainmember'

" Themes
Plug 'sonph/onehalf', { 'rtp': 'vim' } 

" LANGUAGE SPECIFIC PLUGINS

" HTML stuff
" Plug 'mattn/emmet-vim'

call plug#end()

" PLUGIN CONFIGURATIONS

" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " f/p/file-name.js
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

" Indent Line
let g:indentLine_color_term = 239
let g:indetLine_char = '|'

" Python syntax
let g:python_highlight_all = 1
let g:python_slow_sync = 1

" Norminette
let g:syntastic_c_norminette_args = '-R CheckForbiddenSourceHeader'

" Syntastic
set statusline+=%#warningsmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_c_checkers = ['gcc']
let g:syntastic_aggregate_errors = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_compiler_options = "-Wall -Wextra -Werror"

" Ultisnips
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
