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
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
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

	-- For fuzzy stuff
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
	local bool = false

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

-- exit insert/visual
-- vim.keymap.set({'v', 'x', 'i'}, 'kj', '<esc>', NORQ)

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
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { noremap = true });

local function nmap (shortcut, command)
	vim.keymap.set('n', shortcut, command, NORQ)	
end

-- Telescope
-- local telescope = require'telescope.builtin'
-- nmap("<leader>ff", telescope.find_files)
-- nmap("<leader>fs", telescope.live_grep)
-- nmap("<leader>fb", telescope.buffers)
-- nmap("<leader>fh", telescope.help_tags)
-- nmap("<leader>fr", telescope.lsp_references)
-- nmap("<leader>fd", telescope.diagnostics)
-- nmap("<leader>fp", telescope.planets)
-- nmap("<leader>fi", telescope.lsp_implementations)
-- nmap("<leader>ftd", telescope.lsp_type_definitions)
-- nmap("<leader>fgd", telescope.lsp_definitions)
-- nmap("<leader>fgb", telescope.git_bcommits)
-- nmap("<leader>f*", telescope.grep_string)
-- nmap("<leader>f]", telescope.tags)
-- 
-- -- LSP buf
-- local buff = vim.lsp.buf
-- nmap('<leader>kk', buff.hover)
-- nmap('<leader>sh', buff.signature_help)
-- nmap('<leader>gD', buff.declaration)
-- nmap('<leader>rn', buff.rename)
-- nmap('<leader>fo', buff.format)
-- nmap('<leader>ca', buff.code_action)
-- 
-- -- LSP diag
-- local diag = vim.diagnostic
-- nmap('<leader>dp', diag.goto_prev)
-- nmap('<leader>dn', diag.goto_next)
-- nmap('<leader>df', diag.open_float)

-- Colours
vim.opt.background = 'dark'
vim.cmd.colorscheme('habamax')
vim.api.nvim_set_hl(0, 'Normal', {ctermbg = 'none'})
vim.api.nvim_set_hl(0, 'Whitespace', {ctermbg = 'none'})
vim.api.nvim_set_hl(0, 'SignColumn', {ctermbg = 'none'})
vim.hl.on_yank({higroup = 'Visual', timeout = 200})
