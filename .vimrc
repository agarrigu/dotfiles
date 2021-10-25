" Aparently I need this
set nocompatible
filetype plugin indent on

" Display and metadata
syntax on
set number
set wrap
set showmatch
set background=dark

" Navigation and editig
set backspace=indent,eol,start
set clipboard=unnamedplus

" Indentation
set autoindent
set smartindent

" Tabs and Spaces
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab

" Terminal
let &titlestring = @%
set title
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif 

" Searches
set hlsearch

" MY REMAPS
inoremap <ESC> <ESC>:w<cr> 
nnoremap <ESC> :noh<RETURN><ESC> <bar> :let @/ = "" <CR>

" PLUGINS!
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'

" Aesthetics and metadata stuff
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Navigation and editing stuff
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/taglist.vim'
Plug 'SirVer/ultisnips'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'ervandew/supertab'

" LANGUAGE SPECIFIC PLUGINS

" Front-end stuff
Plug 'mattn/emmet-vim'

" Java stuff

" JS stuff
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

" Python stuff
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop' }
Plug 'vim-python/python-syntax'

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
let g:user_emmet_leader_key=','

" Indent Line
let g:indentLine_color_term = 239
let g:indetLine_char = '|'

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>
set t_Co=256

" Python syntax
let g:python_highlight_all = 1
let g:python_slow_sync = 1

" Theme -- molokai
colorscheme molokai
let g:airline_theme='molokai'
let g:rehash256 = 1

" Ultisnips
let g:UltiSnipsExpandTrigger = "<c-b>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
