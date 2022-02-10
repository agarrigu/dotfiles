" Aparently I need this
set nocompatible

" Big stuff
filetype plugin indent on
set hidden
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set updatetime=100

" Display and metadata
syntax on
set background=dark
set cc=80
set cmdheight=1
set conceallevel=0
set cursorline
set laststatus=2
set linebreak
set number
set ruler
set showmatch
" set signcolumn
set wildmenu
set wrap

" Navigation and editig
set backspace=indent,eol,start
set foldmethod=syntax
set foldlevel=99

" Indentation
set autoindent
set smartindent

" Searches
set hlsearch
set incsearch
set ignorecase
set showmatch
set smartcase

" Tabs and Spaces
set expandtab
set shiftwidth=4
set smarttab
set softtabstop=0
set tabstop=4

" Terminal
let &titlestring = @%
set title
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif 

" MY REMAPS
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader>w :w<CR> 
nnoremap <ESC> :let@/=""<CR>
nnoremap <leader>rr :set relativenumber!<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

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
" Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-sort-motion'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Navigation stuff
Plug 'christoomey/vim-tmux-navigator'

" Text Objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'vim-scripts/argtextobj.vim'

" LANGUAGE SPECIFIC PLUGINS

" HTML stuff
Plug 'mattn/emmet-vim'

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

" Emmet
let g:user_emmet_leader_key='<c-m>'

" Indent Line
let g:indentLine_color_term = 239
let g:indetLine_char = '|'

" Python syntax
let g:python_highlight_all = 1
let g:python_slow_sync = 1


" Ultisnips
let g:UltiSnipsExpandTrigger = "<c-b>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
