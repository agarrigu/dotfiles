--   _       _ _     _               --
--  (_)_ __ (_) |_  | |_   _  __ _   --
--  | | '_ \| | __| | | | | |/ _` |  --
--  | | | | | | |_ _| | |_| | (_| |  --
--  |_|_| |_|_|\__(_)_|\__,_|\__,_|  --

-- SETTINGS --

-- Import `.vimrc`
vim.cmd('source ~/.vimrc')

vim.o.signcolumn='yes:1'
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'lua vim.treesitter.foldexpr()'

-- LSP CONFIG --

vim.diagnostic.config({ virtual_text = false, underline = false, })
vim.lsp.enable({ 'lua_ls', 'clangd' })
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

-- MAPPINGS --

local NORQ = { noremap = true, silent = true}

-- LSP buffer
local buf = vim.lsp.buf
vim.keymap.set('n', 'grD', buf.declaration, NORQ)
vim.keymap.set('n', 'grd', buf.definition, NORQ)
vim.keymap.set('n', 'gr=', buf.format, NORQ)

-- LSP diagnostics
local diag = vim.diagnostic
vim.keymap.set('n', 'sd[', diag.goto_prev, NORQ)
vim.keymap.set('n', 'sd]', diag.goto_next, NORQ)
vim.keymap.set('n', 'sdf', diag.open_float, NORQ)

-- COLOURS --

vim.opt.background = 'dark'
vim.cmd.colorscheme('habamax')
vim.api.nvim_set_hl(0, 'Normal', {ctermbg = 'none'})
vim.api.nvim_set_hl(0, 'Whitespace', {ctermbg = 'none'})
vim.api.nvim_set_hl(0, 'SignColumn', {ctermbg = 'none'})
vim.hl.on_yank({higroup = 'Visual', timeout = 200})

-- PLUGINS --

-- TODO: Does this really need to be a for loop?
vim.pack.add(vim.g.my_plugins)

vim.pack.add({
	-- Trying
	'https://github.com/MeanderingProgrammer/render-markdown.nvim',
	'https://github.com/jbyuki/venn.nvim',
	'https://github.com/nguyenvukhang/nvim-toggler',
	'https://github.com/echasnovski/mini.pick',

	-- Very important
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/sharkdp/fd',
	'https://github.com/BurntSushi/ripgrep',
	'https://github.com/nvim-treesitter/nvim-treesitter',

	-- Nice to have
	'https://github.com/lewis6991/gitsigns.nvim',
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

-- PLUGIN MAPPINGS --

-- MiniPick
local pick = require('mini.pick').builtin
vim.keymap.set('n', 'sf', pick.files, NORQ)
vim.keymap.set('n', 'sl', pick.grep_live, NORQ)
vim.keymap.set('n', 'ss', pick.grep, NORQ)
vim.keymap.set('n', 'sb', pick.buffers, NORQ)
vim.keymap.set('n', 'sh', pick.help, NORQ)
