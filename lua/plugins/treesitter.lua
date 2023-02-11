-- treesitter config
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		matchup = { enable = true },
		ensure_installed = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"go",
			"html",
			"java",
			"json5",
			"jsonc",
			"kotlin",
			"rust",
			"scheme",
			"scss",
			"svelte",
			"typescript",
			"vue",
		},
	},
	dependencies = {
		-- better matchup which can be intergreted to treesitter
		"andymass/vim-matchup",
	},
}
