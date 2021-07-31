return require('packer').startup(function()
  -- package manager
  use 'wbthomason/packer.nvim'

  -- lua functions
  use 'nvim-lua/plenary.nvim'
  -- popup windows implementation
  use 'nvim-lua/popup.nvim'
  -- icons for other plugins
  use 'kyazdani42/nvim-web-devicons'
  -- termial integration
  use 'akinsho/nvim-toggleterm.lua'

  -- auto completion
  use 'hrsh7th/nvim-compe'
  -- lsp support
  use 'neovim/nvim-lspconfig'
  -- treesitter config
  use 'nvim-treesitter/nvim-treesitter'
  -- auto pairs
  use 'windwp/nvim-autopairs'
  -- auto tags
  use 'windwp/nvim-ts-autotag'
  -- surround with
  use 'blackCauldron7/surround.nvim'
  -- comment
  use 'b3nj5m1n/kommentary'
  -- indent
  use 'lukas-reineke/indent-blankline.nvim'

  -- color scheme
  use 'glepnir/zephyr-nvim'
  -- status line
  use 'hoob3rt/lualine.nvim'
  -- clickable buffer line
  use 'akinsho/nvim-bufferline.lua'
  -- git integration
  use 'lewis6991/gitsigns.nvim'
  -- which-key
  use 'folke/which-key.nvim'

  -- snippet support
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'
  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  -- media file preview extension for telescope
  use 'nvim-telescope/telescope-media-files.nvim'
end)
