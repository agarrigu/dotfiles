return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function ()
		require'nvim-treesitter.configs'.setup {
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"comment",
				"css",
				"dockerfile",
				"html",
				"lua",
				"java",
				"javascript",
				"json",
				"make",
				"markdown",
				"markdown_inline",
				"php",
				"python",
				"regex",
				"rust",
				"scss",
				"sql",
				"typescript",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = { enable = true, },
			incremental_selection = { enable = true, },
			indentation = { enable = true, },
		}
	end
}
