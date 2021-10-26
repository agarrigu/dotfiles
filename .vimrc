" Aparently I need this
set nocompatible

" Big stuff
filetype plugin indent on
set mouse=a
set updatetime=100

" Display and metadata
syntax on
set background=dark
set conceallevel=0
set laststatus=2
set number
set showmatch
set wrap

" Navigation and editig
set backspace=indent,eol,start
set clipboard=unnamedplus

" Indentation
set autoindent
set smartindent

" Searches
set hlsearch

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
let mapleader = "\\"
inoremap <ESC> <ESC>:w<cr> 
nnoremap <ESC> :let @/ = "" <CR>

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
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Yggdroot/indentLine'

" Autocomplete stuff
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/taglist.vim' " delete when installing coc

" Editing stuff
Plug 'tpope/vim-surround'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Navigation stuff
Plug 'sharkdp/fd' " find entries in file system for telescope
Plug 'scrooloose/nerdtree'
Plug 'BurntSushi/ripgrep' " grep for telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim',  { 'do': 'make' } " native telescope sorter
Plug 'christoomey/vim-tmux-navigator'
"Plug 'ervandew/supertab'
Plug 'kyazdani42/nvim-web-devicons' " icons for telescope

" LANGUAGE SPECIFIC PLUGINS

" Front-end stuff
Plug 'mattn/emmet-vim'

" Java stuff

" JS stuff
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

" Lua stuff
Plug 'nvim-lua/plenary.nvim'

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

" Telscope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Theme -- molokai
colorscheme molokai
let g:airline_theme='molokai'
let g:rehash256 = 1

" Ultisnips
let g:UltiSnipsExpandTrigger = "<c-b>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
