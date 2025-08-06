""        _                     ""
"" __   _(_)_ __ ___  _ __ ___  ""
"" \ \ / / | '_ ` _ \| '__/ __| ""
""  \ V /| | | | | | | | | (__  ""
"" (_)_/ |_|_| |_| |_|_|  \___| ""

" Big stuff
filetype plugin indent on
set autoread
set noautowrite
set hidden
set nocompatible
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set timeoutlen=640
set encoding=utf-8
set undofile
if !has('nvim')
	set undodir=~/.vim/undodir
elseif has('nvim')
	set undodir=~/.config/nvim/undodir
endif

" Display and metadata
syntax on
set background=dark
set colorcolumn=80
set cursorline
set laststatus=2
set linebreak
set list
set listchars=tab:\ \ ,trail:·
set noshowmode
set nowrap
set number
set relativenumber
set ruler
set scrolloff=8
set showcmd
set showmatch
set spell
set spelllang=en_gb
set synmaxcol=300
set wildmenu

" Navigation and editing
set backspace=indent,eol,start
set foldmethod=syntax
set foldlevel=99

" Auto Completion
set omnifunc=syntaxcomplete#Complete

" Tabs and Spaces
set shiftwidth=4
set tabstop=4
set noexpandtab

" Indentation
set autoindent
set smartindent

" Searches
set nohlsearch
set incsearch
set ignorecase
set smartcase
set path+=**

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Pretty
colorscheme habamax
hi Normal ctermbg=NONE

nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader=","

" MY REMAPS
nnoremap <leader><leader> :let@/=""<CR>

inoremap kj <esc>
vnoremap kj <esc>

nnoremap Y y$

nnoremap { :<c-u>execute "keepjumps norm! " . v:count1 . "{"<cr>
nnoremap } :<c-u>execute "keepjumps norm! " . v:count1 . "}"<cr>

nnoremap J mzJ`z
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

map q: <nop>
nnoremap Q <nop>
nnoremap ZZ <nop>

nnoremap <localleader>dl diffget LOCAL
nnoremap <localleader>dr diffget REMOTE
nnoremap <localleader>db diffget BASE

nnoremap <leader>ff :find<space>

" Create tags file
command! Maketags !ctags -R .

augroup remember_cursor_on_reopen
	autocmd!
	autocmd BufReadPost * silent! normal! g`"zv
augroup end

augroup yank_restore_cursor
	autocmd!
	autocmd VimEnter,CursorMoved *
		\ let s:cursor = getpos('.')
	autocmd TextYankPost *
		\ if v:event.operator ==? 'y' |
			\ call setpos('.', s:cursor) |
		\ endif
augroup end

augroup highlight_yanked_text
	autocmd!
	autocmd TextYankPost * call FlashYankText()
augroup end

function! FlashYankText()
	if (!exists('g:yank_text_matches'))
		let g:yank_text_matches = []
	endif

	let match_id = matchadd('IncSearch', ".\\%>'\\[\\_.*\\%<']..")
	let win_id = winnr()

	call add(g:yank_text_matches, [win_id, match_id])
	call timer_start(120, 'DeleteTempMatch')
endfunction

function! DeleteTempMatch(timer_id)
	while !empty(g:yank_text_matches)
		let match = remove(g:yank_text_matches, 0)
		let win_id = match[0]
		let match_id = match[1]

		try
			call matchdelete(match_id, win_id)
		endtry
	endwhile
endfunction

" PLUGINS!

let my_plugins = [
	"\ Editing and navigation
	\'https://github.com/christoomey/vim-tmux-navigator',
	\'https://github.com/tpope/vim-repeat',
	\'https://github.com/tpope/vim-surround',
	"\ Text Objects
	\'https://github.com/kana/vim-textobj-user',
	\'https://github.com/kana/vim-textobj-entire',
	\'https://github.com/kana/vim-textobj-indent',
	\'https://github.com/kana/vim-textobj-function',
	\'https://github.com/adolenc/vim-textobj-toplevel',
	\'https://github.com/D4KU/vim-textobj-chainmember',
	\'https://github.com/mattn/vim-textobj-url',
	\'https://github.com/Julian/vim-textobj-variable-segment',
	\'https://github.com/vim-scripts/argtextobj.vim',
	\]

if !has('nvim')

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

	for p in my_plugins
		Plug p
	endfor

	Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-commentary'

	" Tidalcycles
	Plug 'tidalcycles/vim-tidal'

	call plug#end()

endif
