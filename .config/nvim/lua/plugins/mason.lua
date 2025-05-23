return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function ()
		local lspconf      = require("lspconfig")
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				'clangd',
				'marksman',
				'lua_ls',
			},
			handlers = {
				function(server)
					lspconf[server].setup {}
				end,
				['lua_ls'] = function ()
					lspconf.lua_ls.setup {
						settings = { Lua = { diagnostics = { globals = { 'vim' }}}}}
				end,
			},
		})
	end
}
