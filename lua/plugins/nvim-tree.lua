-- file explorer
return {
    "kyazdani42/nvim-tree.lua",
    config = function()
        local tree = require("nvim-tree")
        tree.setup({
            sort_by = "case_sensitive",
            view = {
                adaptive_size = true,
                mappings = {
                    list = {
                        { key = "u", action = "dir_up" }
                    },
                },
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true
                }
            }
        })

        vim.keymap.set("n", "\\", tree.toggle)
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}
