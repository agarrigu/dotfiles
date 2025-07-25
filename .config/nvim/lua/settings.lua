local set = vim.opt
local let = vim.g
local setw = vim.wo

-- Big stuff
set.encoding = 'utf-8'
set.mouse = 'a'
set.backup = false
set.swapfile = false
set.updatetime = 42
set.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Display and metadata
set.cc = '80'
set.cmdheight = 2
set.cursorline = true
set.laststatus = 2
set.linebreak = true
set.list = true
set.listchars = 'tab:  ,trail:·'
set.showmatch = true
set.wrap = false

-- Spell checking
set.spell = true
set.spelllang = 'en_gb'

-- Navigation and editing
set.backspace = 'indent,eol,start'
setw.foldmethod = 'expr' -- Not sure y this needs to be vim.wo but there u go
setw.foldexpr = 'nvim_treesitter#foldexpr()' -- See comment above
set.foldlevel = 99
set.scrolloff = 8

-- Indentation
set.autoindent = true
set.smartindent = true

-- Searches
set.hlsearch = false
set.incsearch = true
set.ignorecase = true
set.showmatch = true
set.smartcase = true

-- Sideruler
set.number = true
set.relativenumber = true
set.ruler = true
set.signcolumn = 'yes:1'

-- Tabs and Spaces
set.expandtab = false
set.shiftwidth = 4
set.tabstop = 4

-- Leaders
let.mapleader = ' '
let.maplocalleader = '\\'

-- LSP stuff
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})
