require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "go",
        "bash",
        "c",
        "cpp",
        "cmake",
        "lua",
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "tsx",
        "vue",
        "svelte",
        "json",
        "json5",
        "jsonc",
        "rust",
        "java",
        "kotlin",
        "python",
        "comment",
    },
    -- auto tag with nvim-ts-autotag
    autotag = { enable = true },
    highlight = { enable = true },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    }
})

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
