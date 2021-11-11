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
set foldmethod=syntax
set foldlevel=99
set laststatus=2
set number
set ruler
set signcolumn=number
set showmatch
set wrap
set wildmenu

" Navigation and editig
set backspace=indent,eol,start
set clipboard=unnamedplus

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
inoremap <ESC> <ESC>:w<CR> 
nnoremap <ESC> :let@/=""<CR>
nnoremap <leader>re :set relativenumber!<cr>

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

" Editing stuff
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'

" Git stuff
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" LSP stuff
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
                                    " compatibility for ultisnips & nvim-cmp
Plug 'glepnir/lspsaga.nvim'
Plug 'williamboman/nvim-lsp-installer'

" Navigation stuff
Plug 'sharkdp/fd'                   " find entries in file system for telescope
Plug 'scrooloose/nerdtree'
Plug 'BurntSushi/ripgrep'           " grep for telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim',  { 'do': 'make' } 
                                    " native telescope sorter
Plug 'christoomey/vim-tmux-navigator'
"Plug 'ervandew/supertab'
Plug 'kyazdani42/nvim-web-devicons' " icons for telescope


" LANGUAGE SPECIFIC PLUGINS

" HTML stuff
Plug 'mattn/emmet-vim'

" Lua stuff
Plug 'nvim-lua/plenary.nvim'        " depency for can't remember

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
