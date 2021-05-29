local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
    ensure_installed = {
	"c",
	"cpp",
        "lua",
        "bash",
        "json",
        "html",
        "css",
        "javascript",
        "python"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    },
    autotag = {
        enable = true
    }
}
