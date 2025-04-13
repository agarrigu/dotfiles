return {
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
 "ayu-theme/ayu-vim",
 "NLKNguyen/papercolor-theme",
	{
		"KabbAmine/yowish.vim",
		priority = 1000,
		lazy = false,
		config = function ()
			vim.cmd.colorscheme("PaperColor")
			vim.api.nvim_set_hl(0, "Normal", {ctermbg = "none"})
			vim.api.nvim_set_hl(0, "Whitespace", {ctermbg = "none"})
			vim.api.nvim_set_hl(0, "SignColumn", {ctermbg = "none"})
		end,
	},
	"rakr/vim-one",

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
