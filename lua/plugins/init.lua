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
        event = "BufRead",
        config = {}
    },

    -- automatic highlight current symbol
    {
        "RRethy/vim-illuminate",
        event = "BufRead"
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
        config = {}
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("indent_blankline").setup({
                buftype_exclude = { "terminal", "nofile" },
            })
        end,
    },

    -- color scheme
    {
        "olimorris/onedarkpro.nvim",
        config = function()
            vim.cmd("colorscheme onedark")
        end
    },

    -- which-key
    {
        "folke/which-key.nvim",
        event = "BufWinEnter",
        config = function()
            require("which-key").setup()
        end,
    },

}
