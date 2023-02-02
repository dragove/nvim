return {
    -- lua functions
    "nvim-lua/plenary.nvim",
    -- notification manager
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
            -- hardcoded background color
            vim.notify.setup({ background_colour = "#282c34" })
        end
    },

    -- surround support
    {
        "kylechui/nvim-surround",
        config = {}
    },

    -- better lisp editing
    {
        "eraserhd/parinfer-rust",
        ft = { "lisp", "scheme" },
        build = "cargo build --release"
    },
    -- comment
    {
        "numToStr/Comment.nvim",
        keys = { "gc", "gb", { "gc", mode = "x" }, { "gb", mode = "x" } },
        config = {}
    },

    -- color scheme
    {
        "olimorris/onedarkpro.nvim",
        config = function()
            vim.cmd("colorscheme onedark")
        end
    },
}
