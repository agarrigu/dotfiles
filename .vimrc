" Big stuff
filetype plugin indent on
set hidden
set nocompatible
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set updatetime=42
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
set listchars=tab:⇁\ ,trail:·
set number
set relativenumber
set ruler
set showmatch
set scrolloff=8
set signcolumn=no
set wildmenu
set wrap
set noshowmode
set showcmd

" Navigation and editig
set backspace=indent,eol,start
set foldmethod=syntax
set foldlevel=99

" Auto Completion
set omnifunc=syntaxcomplete#Complete

" Indentation
set autoindent
set smartindent

" Pretty
colorscheme molokai
hi Normal ctermbg=NONE

" Searches
set nohlsearch
set incsearch
set ignorecase
set showmatch
set smartcase
set path+=**

" Tabs and Spaces
set shiftwidth=4
set tabstop=4
set noexpandtab

" MY REMAPS
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <leader>w :wall<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader><leader> :let@/=""<CR>
nnoremap <leader>rr :set relativenumber!<cr>

inoremap kj <esc>
vnoremap kj <esc>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap Y y$

nnoremap { :<c-u>execute "keepjumps norm! " . v:count1 . "{"<cr>
nnoremap } :<c-u>execute "keepjumps norm! " . v:count1 . "}"<cr>

nnoremap J mzJ`z
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <leader>sh <c-w><c-h>
nnoremap <leader>sj <c-w><c-j>
nnoremap <leader>sk <c-w><c-k>
nnoremap <leader>sl <c-w><c-l>

map q: <nop>
nnoremap Q <nop>
nnoremap ZZ <nop>

nnoremap <leader>dl diffget LOCAL
nnoremap <leader>dr diffget REMOTE
nnoremap <leader>db diffget BASE

" Create tags file
command! Maketags !ctags -R .

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
Plug 'itchyny/lightline.vim'

" Editing stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'christoomey/vim-sort-motion'
Plug 'vim-scripts/ReplaceWithRegister'

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
Plug 'D4KU/vim-textobj-headedblock'
Plug 'libclang-vim/vim-textobj-clang'

call plug#end()

" PLUGIN CONFIGURATIONS
