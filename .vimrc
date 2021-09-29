set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

filetype plugin indent on

" UI
syntax on
set number
set backspace=indent,eol,start
set wrap
set showmatch
set clipboard=unnamedplus
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

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

" Searches
set hlsearch

" MY REMAPS
inoremap <ESC> <ESC>:w<cr>
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
"Plug 'sheerun/vim-polyglot'
Plug 'python-mode/python-mode', {'for': 'python', 'branch': 'develop' }
Plug 'vim-python/python-syntax'
Plug 'honza/vim-snippets'
"Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
"Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/taglist.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'leafgarland/typescript-vim'
Plug 'SirVer/ultisnips'

call plug#end()

" PLUGs CONF

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

" NERDTree
nmap <C-n> :NERDTreeToggle<CR>
set t_Co=256

" Python syntax
let g:python_highlight_all = 1
let g:python_slow_sync = 1

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Theme -- molokai
colorscheme molokai
let g:airline_theme='molokai'
let g:rehash256 = 1

" Ultisnips
let g:UltiSnipsExpandTrigger = "<c-b>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
set completeopt-=preview
