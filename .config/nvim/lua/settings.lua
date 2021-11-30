local set = vim.opt
local let = vim.g

-- Big stuff
set.encoding = 'utf-8'
set.mouse = 'a'
set.backup = false
set.swapfile = false
set.updatetime = 100

-- Colours
set.background = 'dark'
vim.cmd([[
  colorscheme ayu
]])
set.termguicolors = true

-- Display and metadata
set.cmdheight = 1
set.cc = '80'
set.cursorline = true
set.foldmethod = 'syntax'
set.foldlevel = 99
set.laststatus = 2
set.showmatch = true
set.wrap = true

-- Navigation and editig
set.backspace = 'indent,eol,start'
set.clipboard = 'unnamedplus'

-- Indentation
set.autoindent = true
set.smartindent = true

-- Searches
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.showmatch = true
set.smartcase = true

-- Sideruler
set.number = true
set.ruler = true
set.signcolumn = 'number'

-- Tabs and Spaces
set.expandtab = true
set.shiftwidth = 4
set.smarttab = true
set.softtabstop = 0
set.tabstop = 4

---- MY REMAPS
--nnoremap <SPACE> <Nop>
--let mapleader = " "
--inoremap <ESC> <ESC>:w<CR>
--nnoremap <ESC> :let@/ = ""<CR>
--nnoremap <leader>re :set relativenumber!<cr>
