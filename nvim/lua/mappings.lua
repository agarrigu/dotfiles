local let = vim.g

local function map(mode, shortcut, command)
  vim.keymap.set(mode, shortcut, command, { noremap = true, silent = true })
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

-- local function tmap(shortcut, command)
--   map('t', shortcut, command)
-- end


-- vim.keymap.del('n', ' ', { noremap = true, silent = true })
let.mapleader = ' '
let.maplocalleader = '\\'

-- exit insert/visual

imap('kj', '<esc>')
vmap('kj', '<esc>')

-- Clear mathces
nmap('<leader><space>', ':noh<cr>:call clearmatches()<cr>')

-- Toggle relative/absolute number ruler
nmap('<leader>rl', ':set relativenumber!<cr>')

-- Quick Save All
nmap('<leader>w', '<cmd>wa<cr>')

-- Quick quit
nmap('<leader>q', '<cmd>q<cr>')

-- Begining & End of line in Normal mode
nmap('H', '^')
nmap('L', 'g_')

-- Split screen
nmap('<C-w>v', '<C-w>s')
nmap('<C-w>h', '<C-w>v')

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
nmap('<leader>vs', '<cmd>edit ~/.config/nvim/lua/settings.lua<cr>')
nmap('<leader>vp', '<cmd>edit ~/.config/nvim/plugin/plugins.lua<cr>')
nmap('<leader>vm', '<cmd>edit ~/.config/nvim/lua/mappings.lua<cr>')

-- PLUGINS --

-- Easy Align
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', { noremap = false, silent = true })

-- Emmet
let.user_emmet_leader_key = '<c-n>'

-- nvim-cmp
-- local cmp = require'cmp.utils'
-- nmap("<tab>", cmp)

-- Telescope
local telescope = require'telescope.builtin'
nmap("<leader>ff", telescope.find_files)
nmap("<leader>fs", telescope.live_grep)
nmap("<leader>fb", telescope.buffers)
nmap("<leader>fh", telescope.help_tags)
nmap("<leader>fr", telescope.lsp_references)
nmap("<leader>fd", telescope.diagnostics)
nmap("<leader>fp", telescope.planets)
nmap("<leader>fi", telescope.lsp_implementations)
nmap("<leader>ft", telescope.lsp_type_definitions)
nmap("<leader>fe", telescope.lsp_definitions)

-- Harpoon
local harpoon = require'harpoon'
harpoon:setup() -- REQUIRED
nmap("<leader>hh", function() harpoon:list():add() end)
nmap("<leader>hl",
	function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
nmap("<leader>ha", function() harpoon:list():select(1) end)
nmap("<leader>hs", function() harpoon:list():select(2) end)
nmap("<leader>hd", function() harpoon:list():select(3) end)
nmap("<leader>hf", function() harpoon:list():select(4) end)
nmap("<leader>hn", function() harpoon:list():next(4) end)
nmap("<leader>hp", function() harpoon:list():prev(4) end)

-- LSP buf
local buff = vim.lsp.buf
nmap('K', buff.hover)
nmap('<c-k>', buff.signature_help)
nmap('gD', buff.declaration)
nmap('gd', buff.definition)
nmap('gi', buff.implementation)
nmap('gr', buff.references)
nmap('<leader>rn', buff.rename)
nmap('<leader>D', buff.type_definition)
nmap('<leader>f', buff.format)
nmap('<leader>ca', buff.code_action)

-- LSP diag
local diag = vim.diagnostic
nmap('[d', diag.goto_prev)
nmap(']d', diag.goto_next)
nmap('<leader>df', diag.open_float)
