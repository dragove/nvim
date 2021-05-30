return require('packer').startup(function()
  -- package manager
  use 'wbthomason/packer.nvim'

  -- lua functions
  use 'nvim-lua/plenary.nvim'
  -- popup windows implementation
  use 'nvim-lua/popup.nvim'
  -- icons for other plugins
  use 'kyazdani42/nvim-web-devicons'

  -- auto completion
  use 'hrsh7th/nvim-compe'
  -- lsp support
  use 'neovim/nvim-lspconfig'
  -- treesitter config
  use 'nvim-treesitter/nvim-treesitter'
  -- auto pairs
  use 'steelsojka/pears.nvim'
  -- surround with
  use 'blackCauldron7/surround.nvim'

  -- color scheme
  use 'glepnir/zephyr-nvim'
  -- status line
  use 'hoob3rt/lualine.nvim'
  -- clickable buffer line
  use 'akinsho/nvim-bufferline.lua'

  -- snippet support
  use 'hrsh7th/vim-vsnip'
  use 'rafamadriz/friendly-snippets'

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'
  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  -- media file preview extension for telescope
  use 'nvim-telescope/telescope-media-files.nvim'
end)
