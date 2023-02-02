-- treesitter config
return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        local function disable_for_large_file(lang, bufnr, module)
            local disabled = vim.api.nvim_buf_line_count(bufnr) > 7000;
            if disabled then
                print(module .. " is disabled in this buffer.")
            end
            return disabled
        end

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
            autotag = { enable = true },
            matchup = { enable = true },
            highlight = { enable = true },
            context_commentstring = {
                enable = true,
                enable_autocmd = false
            },
        })

        vim.o.foldmethod = "expr"
        vim.o.foldexpr = "nvim_treesitter#foldexpr()"
    end,
    dependencies = {
        -- better matchup which can be intergreted to treesitter
        "andymass/vim-matchup",
        -- auto tags
        "windwp/nvim-ts-autotag",
        -- show scope
        "nvim-treesitter/nvim-treesitter-context",
    }
}
