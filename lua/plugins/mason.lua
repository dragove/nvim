return {
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"clangd",
			"jdtls",
			"shfmt",
			"shellcheck",
			"python-lsp-server",
		},
	},
}
