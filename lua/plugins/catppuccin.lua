return {
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin"
    },
    {
        "akinsho/bufferline.nvim",
        opts = {
            highlights = require("catppuccin.groups.integrations.bufferline").get({
                custom = {
                    all = {
                        background = { bg = "NONE" },
                        close_button = { bg = "NONE" },
                        fill = { bg = "NONE" },
                        separator = { bg = "NONE" },
                    },
                },
            })
        },
        dependencies = {
            "catppuccin"
        }
    }
}
