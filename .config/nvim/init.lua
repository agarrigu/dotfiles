--   _       _ _     _               --
--  (_)_ __ (_) |_  | |_   _  __ _   --
--  | | '_ \| | __| | | | | |/ _` |  --
--  | | | | | | |_ _| | |_| | (_| |  --
--  |_|_| |_|_|\__(_)_|\__,_|\__,_|  --

-- SETTINGS --

vim.cmd('source ~/.vimrc')

vim.o.signcolumn = 'yes:1'
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'lua vim.treesitter.foldexpr()'
vim.o.winborder = 'single'

-- MAPPINGS --

local NORQ = { noremap = true, silent = true}

-- LSP buffer
local buf = vim.lsp.buf
vim.keymap.set('n', 'grD', buf.declaration, NORQ)
vim.keymap.set('n', 'grd', buf.definition, NORQ)
vim.keymap.set('n', 'gr=', buf.format, NORQ)

-- COLOURS --

vim.opt.background = 'dark'
vim.cmd.colorscheme('habamax')
vim.api.nvim_set_hl(0, 'Normal', {ctermbg = 'none'})
vim.api.nvim_set_hl(0, 'Whitespace', {ctermbg = 'none'})
vim.api.nvim_set_hl(0, 'SignColumn', {ctermbg = 'none'})

-- PLUGINS --

vim.pack.add(vim.g.my_plugins)

vim.pack.add({

	-- Trying
	'https://github.com/jbyuki/venn.nvim',
	'https://github.com/nguyenvukhang/nvim-toggler',

	-- Very important
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/sharkdp/fd',
	'https://github.com/BurntSushi/ripgrep',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',

	-- Nice to have
	'https://github.com/echasnovski/mini.pick',
	'https://github.com/lewis6991/gitsigns.nvim',

})

-- LSP CONFIG --

vim.diagnostic.config({ virtual_text = false, underline = false, })
vim.lsp.enable({ 'lua_ls', 'clangd' })
vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' }}}}})
vim.hl.priorities.semantic_tokens = 99

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, args.buf)
		end
	end,
})

-- PLUGIN CONFIG --

require('nvim-toggler').setup()

require('mini.pick').setup()

-- Unbind conflicting vim text objects
vim.keymap.set({ 'x', 'o' }, 'ia', '<nop>')
vim.keymap.set({ 'x', 'o' }, 'aa', '<nop>')
vim.keymap.set({ 'x', 'o' }, 'if', '<nop>')
vim.keymap.set({ 'x', 'o' }, 'if', '<nop>')
vim.keymap.set({ 'x', 'o' }, 'ie', '<nop>')
vim.keymap.set({ 'x', 'o' }, 'ae', '<nop>')

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

	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['if'] = '@function.inner',
				['af'] = '@function.outer',
				['iC'] = '@call.inner',
				['aC'] = '@call.outer',
				['il'] = '@assignment.lhs',
				['ir'] = '@assignment.rhs',
				['iA'] = '@assignment.inner',
				['aA'] = '@assignment.outer',
				['ic'] = '@conditional.inner',
				['ac'] = '@conditional.outer',
				['in'] = '@number.inner',
				['an'] = '@number.outer',
				['ia'] = '@parameter.inner',
				['aa'] = '@parameter.outer',
				['ix'] = '@regex.inner',
				['ax'] = '@regex.outer',
				['ie'] = '@statement.inner',
				['ae'] = '@statement.outer',
				['is'] = '@class.inner',
				['as'] = '@class.outer',
			}
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
}

-- PLUGIN MAPPINGS --

-- Treesitter Textobjects
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- MiniPick
local pick = require('mini.pick').builtin
vim.keymap.set('n', 'sf', pick.files, NORQ)
vim.keymap.set('n', 'sl', pick.grep_live, NORQ)
vim.keymap.set('n', 'ss', pick.grep, NORQ)
vim.keymap.set('n', 'sb', pick.buffers, NORQ)
vim.keymap.set('n', 'sh', pick.help, NORQ)
