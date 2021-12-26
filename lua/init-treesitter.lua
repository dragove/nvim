require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    -- auto tag with nvim-ts-autotag
    autotag = { enable = true },
    highlight = { enable = true },
})

require("nvim-treesitter.query")
