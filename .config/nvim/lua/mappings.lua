local function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function bmap(mode, shortcut, command)
  vim.api.nvim_buf_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
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
nmap('<leader>rr', ':set relativenumber!<cr>')

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
nmap('<leader>vi', '<cmd>edit ~/.config/nvim/init.lua<cr>')
nmap('<leader>vr', '<cmd>source ~/.config/nvim/init.lua<cr>')
nmap('<leader>vs', '<cmd>edit ~/.config/nvim/lua/settings.lua<cr>')
nmap('<leader>vp', '<cmd>edit ~/.config/nvim/lua/plugins.lua<cr>')
nmap('<leader>vm', '<cmd>edit ~/.config/nvim/lua/mappings.lua<cr>')

-- PLUGINS

-- Telescope
nmap("<leader>ff", "<cmd>Telescope find_files<cr>") --list files in wd
nmap("<leader>fs", "<cmd>Telescope live_grep<cr>")  --search for string in wd live!
nmap("<leader>fb", "<cmd>Telescope buffers<cr>")    --list open buffers
nmap("<leader>fh", "<cmd>Telescope help_tags<cr>")  --so useful, search helpdocs
nmap("<leader>fr", "<cmd>Telescope lsp_references<cr>") --list lsp_references
nmap("<leader>fd", "<cmd>Telescope diagnostics<cr>") --goto implementeation

nmap("<leader>gd", "<cmd>Telescope lsp_definitions<cr>")     --goto definition
nmap("<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>")--goto type definition
nmap("<leader>gi", "<cmd>Telescope lsp_implementations<cr>") --goto implementeation


nmap("<leader>ca", "<cmd>Telescope lsp_code_actions<cr>")
vmap('<leader>ca', '<cmd><C-U>Telescope lsp_range_code_action<cr>')

nmap("<leader>fp", "<cmd>lua require'telescope.builtin'.planets{}<cr>")
-- LSP buff
nmap('K', '<cmd>lua vim.lsp.buf.hover()<cr>')
nmap('<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
-- Lspsaga
-- nmap("K", "<cmd>Lspsaga hover_doc<cr>")
nmap('<leader>dn', '<cmd>Lspsaga diagnostic_jump_next<cr>')
nmap('<leader>dp', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
-- nmap('<leader>rn', '<cmd>Lspsaga rename<cr>')
-- nmap('<leader>pd', '<cmd>Lspsaga preview_definition<cr>')
-- nmap('<leader>lf', '<cmd>Lspsaga lsp_finder<cr>')
-- nmap('<leader>ca', '<cmd>Lspsaga code_action<cr>')
-- vmap('<leader>ca', '<cmd><C-U>Lspsaga range_code_action<cr>')
-- nmap('<leader>sh', '<cmd>Lspsaga signature_help<cr>')
 nmap('<leader>dl', '<cmd>Lspsaga show_line_diagnostics<cr>')
 nmap('<leader>dc', '<cmd>Lspsaga show_cursor_diagnostics<cr>')
-- TODO fix next two commented out lines
-- nmap('<C-f>', '<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>')
-- nmap('<C-b>', '<cmd>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>')
