return {
	"jose-elias-alvarez/null-ls.nvim",
	{
		"vinicius507/norme.nvim",
		dependencies = {"jose-elias-alvarez/null-ls.nvim"},
		config = function ()
			require("null-ls").setup({})
			require("norme").setup({
				cmd = os.getenv('HOME') .. '/bin/norminette'
			})
		end
	},
	-- Info
	{
		"nvim-lualine/lualine.nvim",
		config = function ()
			require("lualine").setup{
				options = {
					theme = "16color",
					component_separators = "",
					section_separators = "",
					icons_enabled = false,
				},
			}
		end
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
	},

	-- Colorshemes
	"w0ng/vim-hybrid",
	"morhetz/gruvbox",
	"romainl/apprentice",

	-- Editing stuff
	"christoomey/vim-sort-motion",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tpope/vim-repeat",
	"junegunn/vim-easy-align",
	"justinmk/vim-sneak",
	"vim-scripts/ReplaceWithRegister",
	"42Paris/42header",

	-- Navigation stuff
	"mbbill/undotree",
	"sharkdp/fd",
	"BurntSushi/ripgrep",
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
	},
		opts = { disable_devicons = true, },
	},

	-- Text Objects
	"kana/vim-textobj-entire",
	{
		"kana/vim-textobj-entire",
		dependencies = {"kana/vim-textobj-user",}
	},
	{
		"kana/vim-textobj-function",
		dependencies = {"kana/vim-textobj-user",}
	},
	{
		"kana/vim-textobj-indent",
		dependencies = {"kana/vim-textobj-user",}
	},
	{
		"adolenc/vim-textobj-toplevel",
		dependencies = {"kana/vim-textobj-user",}
	},
	{
		"D4KU/vim-textobj-chainmember",
		dependencies = {"kana/vim-textobj-user",}
	},
	{
		"mattn/vim-textobj-url",
		dependencies = {"kana/vim-textobj-user",}
	},
	{
		"Julian/vim-textobj-variable-segment",
		dependencies = {"kana/vim-textobj-user",}
	},
	"vim-scripts/argtextobj.vim",

	-- Lua Stuff
	"nvim-lua/plenary.nvim",
}
