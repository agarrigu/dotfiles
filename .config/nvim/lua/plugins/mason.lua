return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function ()
		local lspconf = require("lspconfig")
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				'clangd',
				'marksman',
				'lua_ls',
			},
			automatic_enable = true,
		})
		vim.lsp.config('lua_ls', {
			settings = { Lua = { diagnostics = { globals = { 'vim', }, }, }, },
		})
	end
}
