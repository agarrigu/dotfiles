--   _       _ _     _               --
--  (_)_ __ (_) |_  | |_   _  __ _   --
--  | | '_ \| | __| | | | | |/ _` |  --
--  | | | | | | |_ _| | |_| | (_| |  --
--  |_|_| |_|_|\__(_)_|\__,_|\__,_|  --

-- SETTINGS --

-- Big stuff
vim.o.encoding = 'utf-8'
vim.o.mouse = 'a' -- enabled in all modes
vim.o.backup = false
vim.o.swapfile = false

-- Display and metadata
vim.o.cc = '80'
vim.o.cursorline = true
vim.o.laststatus = 2 -- always
vim.o.list = true
vim.o.listchars = 'tab:  ,trail:·'
vim.o.showmatch = true
vim.o.wrap = false

-- Spell checking
vim.o.spell = true
vim.o.spelllang = 'en_gb'

-- Navigation and editing
vim.o.backspace = 'indent,eol,start'
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'lua vim.treesitter.foldexpr()'
vim.o.foldlevel = 99
vim.o.scrolloff = 8

-- Indentation
vim.o.autoindent = true
vim.o.smartindent = true

-- Searches
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Ruler
vim.o.ruler = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes:1'
vim.api.nvim_create_autocmd('InsertEnter', {
	callback = function() vim.o.relativenumber = false end
})
vim.api.nvim_create_autocmd('InsertLeave', {
	callback = function() vim.o.relativenumber = true end
})

-- Tabs and Spaces
vim.o.expandtab = false
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Leaders
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- LSP stuff
vim.diagnostic.config({ virtual_text = false, underline = false, })
vim.lsp.enable({ 'lua_ls', 'marksman', 'clangd' })
vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' }}}}})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
		end
	end
})
vim.cmd('set completeopt+=noselect')

-- PLUGINS --

vim.pack.add({
	-- Trying
	{ src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim', },
	{ src = 'https://github.com/jbyuki/venn.nvim', },
	{ src = 'https://github.com/nguyenvukhang/nvim-toggler', },
	{ src = 'https://github.com/echasnovski/mini.pick', },

	-- Picker stuff
	{ src = 'https://github.com/sharkdp/fd', },
	{ src = 'https://github.com/BurntSushi/ripgrep', },

	-- Treesitter stuff
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', },

	-- Display, editing, and navigation
	{ src = 'https://github.com/christoomey/vim-tmux-navigator', },
	{ src = 'https://github.com/lewis6991/gitsigns.nvim', config = true, },
	{ src = 'https://github.com/tpope/vim-repeat', },
	{ src = 'https://github.com/tpope/vim-surround', },

	-- Text objects
	{ src = 'https://github.com/kana/vim-textobj-user', },
	{ src = 'https://github.com/kana/vim-textobj-entire', },
	{ src = 'https://github.com/kana/vim-textobj-indent', },
	{ src = 'https://github.com/kana/vim-textobj-function', },
	{ src = 'https://github.com/adolenc/vim-textobj-toplevel', },
	{ src = 'https://github.com/D4KU/vim-textobj-chainmember', },
	{ src = 'https://github.com/mattn/vim-textobj-url', },
	{ src = 'https://github.com/Julian/vim-textobj-variable-segment', },
	{ src = 'https://github.com/vim-scripts/argtextobj.vim', },
})

-- PLUGIN CONFIG --

require('nvim-toggler').setup()

require('mini.pick').setup()

require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'asm',
		'bash',
		'c',
		'comment',
		'cpp',
		'lua',
		'make',
		'markdown',
		'markdown_inline',
		'python',
		'regex',
		'typescript',
		'vim',
		'vimdoc',
	},
	auto_install = true,
	highlight = { enable = true, },
	incremental_selection = { enable = true, },
	indent = { enable = true, },
	additional_vim_regex_highlighting = false,
}

-- MAPPINGS --

local NORQ = { noremap = true, silent = true}

-- Remove {} from jump list
vim.keymap.set('n', '{', ':<c-u>execute "keepjumps norm! " . v:count1 . "{"<cr>', NORQ)
vim.keymap.set('n', '}', ':<c-u>execute "keepjumps norm! " . v:count1 . "}"<cr>', NORQ)

-- Keep cursor in place
vim.keymap.set('n', 'J', 'mzJ`z', NORQ)
vim.keymap.set('n', 'n', 'nzzzv', NORQ)
vim.keymap.set('n', 'N', 'Nzzzv', NORQ)

-- nops
vim.keymap.set('n', 'Q', '<nop>', NORQ)
vim.keymap.set('n', 'ZZ', '<nop>', NORQ)

-- Easy Align
vim.keymap.set({ 'n', 'x' }, '<leader>ga', '<Plug>(EasyAlign)', { noremap = true });

-- LSP buffer
local buf = vim.lsp.buf
vim.keymap.set('n', 'K', buf.hover, NORQ)
vim.keymap.set('n', '<leader>K', buf.signature_help, NORQ)
vim.keymap.set('n', 'gD', buf.declaration, NORQ)
vim.keymap.set('n', 'gd', buf.definition, NORQ)
vim.keymap.set('n', '<leader>gi', buf.implementation, NORQ)
vim.keymap.set('n', '<leader>rn', buf.rename, NORQ)
vim.keymap.set('n', '=', buf.format, NORQ)
vim.keymap.set({ 'n', 'x', }, '<leader>ca', buf.code_action, NORQ)

-- LSP diag
local diag = vim.diagnostic
vim.keymap.set('n', '<leader>dp', diag.goto_prev, NORQ)
vim.keymap.set('n', '<leader>dn', diag.goto_next, NORQ)
vim.keymap.set('n', '<leader>df', diag.open_float, NORQ)

-- MiniPick
local pick = require('mini.pick').builtin
vim.keymap.set('n', '<leader>ff', pick.files, NORQ)
vim.keymap.set('n', '<leader>gl', pick.grep_live, NORQ)
vim.keymap.set('n', '<leader>fs', pick.grep, NORQ)
vim.keymap.set('n', '<leader>fb', pick.buffers, NORQ)
vim.keymap.set('n', '<leader>fh', pick.help, NORQ)

-- COLOURS --

vim.opt.background = 'dark'
vim.cmd.colorscheme('habamax')
vim.api.nvim_set_hl(0, 'Normal', {ctermbg = 'none'})
vim.api.nvim_set_hl(0, 'Whitespace', {ctermbg = 'none'})
vim.api.nvim_set_hl(0, 'SignColumn', {ctermbg = 'none'})
vim.hl.on_yank({higroup = 'Visual', timeout = 200})
