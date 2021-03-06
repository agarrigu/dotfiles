-- Install Packer if not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1',
  'https://github.com/wbthomason/packer.nvim', install_path})
end

return require'packer'.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Experimental !!!
  use 'github/copilot.vim'

  -- Aesthetics and metadata stuff
  use'nvim-lualine/lualine.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use'kyazdani42/nvim-web-devicons'
  use'onsails/lspkind-nvim'
  use'lukas-reineke/indent-blankline.nvim'

  -- Editing stuff
  -- use'jiangmiao/auto-pairs'
  use'christoomey/vim-system-copy'
  use'christoomey/vim-sort-motion'
  use'tpope/vim-surround'
  use'tpope/vim-commentary'
  use'tpope/vim-repeat'
  use'hrsh7th/vim-vsnip'
  use'hrsh7th/cmp-vsnip'
  -- use'mg979/vim-visual-multi'
  -- use'sbdchd/neoformat'


  -- Git stuff
  use'tpope/vim-fugitive'
  use'Xuyuanp/nerdtree-git-plugin'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
     'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- LSP stuff
  -- use'mfussenegger/nvim-dap'
  use'hrsh7th/cmp-nvim-lsp'
  use'hrsh7th/cmp-buffer'
  use'hrsh7th/cmp-path'
  use'hrsh7th/cmp-cmdline'
  use'hrsh7th/nvim-cmp'
  use'neovim/nvim-lspconfig'
  use'williamboman/nvim-lsp-installer'

  -- Navigation stuff
  use'sharkdp/fd'                   -- find entries in file system for telescope
  use'BurntSushi/ripgrep'           -- grep for telescope
  -- use'ThePrimeagen/harpoon'
  -- use'andymass/vim-matchup'
  use'christoomey/vim-tmux-navigator'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim'} },
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }

  -- Text Objects
  use'kana/vim-textobj-user'        -- depency for most other text objects
  use'kana/vim-textobj-entire'
  use'kana/vim-textobj-function'
  use'kana/vim-textobj-indent'
  use'mattn/vim-textobj-url'
  use'Julian/vim-textobj-variable-segment'
  use'adolenc/vim-textobj-toplevel'
  use'D4KU/vim-textobj-chainmember'
  use'vim-scripts/argtextobj.vim'

  -- Color Scheme themes
  use'drewtempelmeyer/palenight.vim'
  use'ayu-theme/ayu-vim'
  use'rakr/vim-one'
  use'morhetz/gruvbox'
  use'NLKNguyen/papercolor-theme'
  use'liuchengxu/space-vim-dark'
  use'srcery-colors/srcery-vim'
  use'sickill/vim-monokai'
  use'KabbAmine/yowish.vim'
  use'rebelot/kanagawa.nvim'

  -- LANGUAGE SPECIFIC PLUGINS

  -- HTML stuff
  use'mattn/emmet-vim'

  -- Java stuff
--  use'mfussenegger/nvim-jdtls'

  -- Lua stuff
  use'nvim-lua/plenary.nvim'        -- depency for many a things

  -- Rust stuff
  use'simrat39/rust-tools.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- but does it even lift?
  if Packer_bootstrap then
    require('packer').sync()
  end
end)
