require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    -- auto tag with nvim-ts-autotag
    autotag = { enable = true },
    highlight = { enable = true },
})

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
