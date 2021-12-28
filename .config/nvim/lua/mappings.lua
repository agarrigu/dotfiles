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
imap('<esc>', '<esc>:w<cr>')

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
nmap("<leader>ff", ":Telescope find_files<cr>") --list files in wd
nmap("<leader>fs", ":Telescope live_grep<cr>")  --search for string in wd live!
nmap("<leader>fb", ":Telescope buffers<cr>")    --list open buffers
nmap("<leader>fh", ":Telescope help_tags<cr>")  --so useful, search helpdocs
nmap("<leader>fr", ":Telescope lsp_references<cr>") --list lsp_references

nmap("<leader>gd", ":Telescope lsp_definitions<cr>")     --goto definition
nmap("<leader>gt", ":Telescope lsp_type_definitions<cr>")--goto implementeation
nmap("<leader>gi", ":Telescope lsp_implementations<cr>") --goto type definition

-- Lspsaga
nmap('K', ':Lspsaga hover_doc()<cr>')
nmap('<leader>dn', ':Lspsaga diagnostic_jump_next<cr>')
nmap('<leader>dp', ':Lspsaga diagnostic_jump_prev<cr>')
nmap('<leader>rn', ':Lspsaga rename<cr>')
nmap('<leader>pd', ':Lspsaga preview_definition<cr>')
nmap('<leader>lf', ':Lspsaga lsp_finder<cr>')
nmap('<leader>ca', ':Lspsaga code_action<cr>')
vmap('<leader>ca', ':<C-U>Lspsaga range_code_action<cr>')
nmap('<leader>sh', ':Lspsaga signature_help<cr>')
nmap('<leader>dl', ':Lspsaga show_line_diagnostics<cr>')
nmap('<leader>dc', ':Lspsaga show_cursor_diagnostics<cr>')
nmap('<C-f>', '<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>')
nmap('<C-b>', '<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>')
