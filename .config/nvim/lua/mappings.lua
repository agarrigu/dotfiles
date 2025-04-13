local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
end

local function nymap(shortcut, command)
	vim.keymap.set("n", shortcut, command, { noremap = false })
end

local function nmap(shortcut, command)
  map('n', shortcut, command)
end

local function imap(shortcut, command)
  map('i', shortcut, command)
end

local function vmap(shortcut, command)
  map('v', shortcut, command)
end

-- local function cmap(shortcut, command)
--   map('c', shortcut, command)
-- end

-- local function tmap(shortcut, command)
--   map('t', shortcut, command)
-- end

-- exit insert/visual
imap('kj', '<esc>')
vmap('kj', '<esc>')

-- misc QOL
nmap('<leader><space>', ':noh<cr>:call clearmatches()<cr>') -- Clear mathces
nmap('<leader>rl', ':set relativenumber!<cr>') -- Toggle relative number
nmap('<leader>w', '<cmd>wa<cr>') -- Quick Save All
nmap('<leader>q', '<cmd>q<cr>') -- Quick quit

-- more natural movement with wrap on
nmap('j', 'gj')
nmap('k', 'gk')
vmap('j', 'gj')
vmap('k', 'gk')

-- Remove {} from jump list
nmap('{', ':<c-u>execute "keepjumps norm! " . v:count1 . "{"<cr>')
nmap('}', ':<c-u>execute "keepjumps norm! " . v:count1 . "}"<cr>')

-- Keep cursor in place
nmap("J", "mzJ`z")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

-- nops
nmap("Q", "<nop>")
nmap("ZZ", "<nop>")

-- PLUGINS --

-- Easy Align
nymap('ga', '<Plug>(EasyAlign)');

-- Telescope
local telescope = require'telescope.builtin'
nmap("<leader>ff", telescope.find_files)
nmap("<leader>fs", telescope.live_grep)
nmap("<leader>fb", telescope.buffers)
nmap("<leader>fh", telescope.help_tags)
nmap("<leader>fp", telescope.planets)
