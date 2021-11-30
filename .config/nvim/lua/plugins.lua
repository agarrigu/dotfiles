-- Install Packer if not installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1',
  'https://github.com/wbthomason/packer.nvim', install_path})
end

return require'packer'.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Aesthetics and metadata stuff
  use'nvim-lualine/lualine.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use'kyazdani42/nvim-web-devicons'

  -- Editing stuff
  use'tpope/vim-surround'
  use'L3MON4D3/LuaSnip'

  -- Git stuff
  use'tpope/vim-fugitive'
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
  use'hrsh7th/cmp-nvim-lsp'
  use'hrsh7th/cmp-buffer'
  use'hrsh7th/cmp-path'
  use'hrsh7th/cmp-cmdline'
  use'hrsh7th/nvim-cmp'
  use'neovim/nvim-lspconfig'
  use'williamboman/nvim-lsp-installer'
  use'glepnir/lspsaga.nvim'

  -- Navigation stuff
  use'sharkdp/fd'                   -- find entries in file system for telescope
  use'BurntSushi/ripgrep'           -- grep for telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim'} },
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }
  use'ThePrimeagen/harpoon'

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

  -- LANGUAGE SPECIFIC PLUGINS

  -- HTML stuff
  use'mattn/emmet-vim'

  -- Java stuff
--  use'mfussenegger/nvim-jdtls'

  -- Lua stuff
  use'nvim-lua/plenary.nvim'        -- depency for many a things

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
