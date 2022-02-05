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
  colorscheme one
]])
set.termguicolors = true

-- Display and metadata
set.cmdheight = 2
set.cc = '80'
set.cursorline = true
set.laststatus = 2
set.linebreak = true
set.list = true
set.listchars = 'tab:▸-,trail:·'
set.showmatch = true
set.wrap = true

-- Navigation and editig
set.backspace = 'indent,eol,start'
set.foldmethod = 'syntax'
set.foldlevel = 99
set.scrolloff = 8

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
set.signcolumn = 'yes:2'

-- Tabs and Spaces
set.expandtab = true
set.shiftwidth = 4
set.smarttab = true
set.softtabstop = 0
set.tabstop = 4

-- Integrated Terminal

-- LSP stuff
vim.diagnostic.config({
  virtual_text = false,
  underline = false,
})
