-- treesitter config
return {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
        opts.matchup = { enable = true }
        if type(opts.ensure_installed) == "table" then
            vim.list_extend(opts.ensure_installed, {
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
            })
        end
    end,
    dependencies = {
        -- better matchup which can be intergreted to treesitter
        "andymass/vim-matchup",
    },
}
