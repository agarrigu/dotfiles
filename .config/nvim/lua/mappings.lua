local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
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

local function cmap(shortcut, command)
  map('c', shortcut, command)
end

local function tmap(shortcut, command)
  map('t', shortcut, command)
end

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Clear mathces wit <esc>
nmap('<esc>', ':noh<cr>:call clearmatches()<cr>')

-- Toggle relative/absolute number ruler
nmap('<leader>ra', ':set relativenumber!<cr>')

-- Save when exiting Insert mode
imap('<ESC>', '<ESC>:w<CR>')

-- Begining & End of line in Normal mode
nmap('H', '^')
nmap('L', 'g_')

-- more natural movement with wrap on
nmap('j', 'gj')
nmap('k', 'gk')
vmap('j', 'gj')
vmap('k', 'gk')

-- home and end line in command mode
cmap('<C-a>', '<Home>')
cmap('<C-e>', '<End>')

-- edit init.vim
nmap('<leader>ve', ':edit ~/.config/nvim/init.lua<cr>')
nmap('<leader>vr', ':source ~/.config/nvim/init.lua<cr>')
nmap('<leader>vs', ':edit ~/.config/nvim/lua/settings.lua<cr>')
nmap('<leader>vp', ':edit ~/.config/nvim/lua/plugins.lua<cr>')
nmap('<leader>vm', ':edit ~/.config/nvim/lua/mappings.lua<cr>')

-- PLUGINS

-- Telescope
nmap("<leader>ff", "<cmd>Telescope find_files<cr>")
nmap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")
nmap("<leader>fu", "<cmd>Telescope lsp_references<cr>") -- find symbol in proj

nmap("<leader>gd", "<cmd>Telescope lsp_definitions<cr>") --goto definition

-- Lspsaga
nmap('K', '<cmd>Lspsaga hover_doc()<cr>')
-- TODO add intuitive scroll down and up hover doc
nmap('<leader>dn', '<cmd>Lspsaga diagnostic_jump_next<cr>')
nmap('<leader>dp', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
nmap('<leader>rn', '<cmd>Lspsaga rename<cr>')
nmap('<leader>pd', '<cmd>Lspsaga preview_definition<cr>')
-- TODO add remaining
