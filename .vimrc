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
" hi NonText guibg=NONE ctermbg=NONE
" hi ColorColumn guibg=NONE ctermbg=NONE

" Searches
set hlsearch
set incsearch
set ignorecase
set showmatch
set smartcase
set path+=**

" Tabs and Spaces
set shiftwidth=4
set smarttab
set softtabstop=0
set tabstop=4

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

map q: <nop>
nnoremap Q <nop>


" Create tags file
command! MakeTags !ctags -R .

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
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-sort-motion'
Plug 'vim-scripts/ReplaceWithRegister'

" Auto-completion

" Navigation stuff
Plug 'christoomey/vim-tmux-navigator'

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

" Netrw
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=0
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'
