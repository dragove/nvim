return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "onedark",
		},
		dependencies = {
			"olimorris/onedarkpro.nvim",
		},
	},
	-- disable some plugins
	{ "folke/tokyonight.nvim", enabled = false },
	{ "catppuccin", enabled = false },
	{ "vim-startuptime", enabled = false },
}
