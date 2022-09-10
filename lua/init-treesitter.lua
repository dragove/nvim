require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "css",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "json5",
        "jsonc",
        "kotlin",
        "lua",
        "python",
        "rust",
        "scheme",
        "scss",
        "svelte",
        "tsx",
        "typescript",
        "vue",
    },
    -- auto tag with nvim-ts-autotag
    autotag = { enable = true },
    highlight = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    }
})

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
