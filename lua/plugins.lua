return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- lua functions
  use 'nvim-lua/plenary.nvim'

  -- color scheme
  use 'glepnir/zephyr-nvim'

  -- languages support
  use "nvim-treesitter/nvim-treesitter"
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-compe"
  use "onsails/lspkind-nvim"

  use "akinsho/nvim-bufferline.lua"
  use "glepnir/galaxyline.nvim"
  use "windwp/nvim-autopairs"
  use "blackCauldron7/surround.nvim"

  -- snippet support
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"

  -- file managing , picker etc
  use "nvim-lua/popup.nvim"
  use "ryanoasis/vim-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "kyazdani42/nvim-web-devicons"
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"
end)
