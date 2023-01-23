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

    -- markdown support
    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast"
    },
    -- automatic highlight current symbol
    "RRethy/vim-illuminate",
    -- better lisp editing
    {
        "eraserhd/parinfer-rust",
        build = "cargo build --release"
    },
    -- auto pairs
    "windwp/nvim-autopairs",
    -- comment
    {
        "numToStr/Comment.nvim",
        config = {}
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                char = "┊",
                buftype_exclude = { "terminal" },
            })
        end,
    },

    -- color scheme
    {
        "olimorris/onedarkpro.nvim",
        event = "BufEnter",
        config = function()
            vim.cmd("colorscheme onedark")
        end,
    },

    -- clickable buffer line
    {
        "akinsho/nvim-bufferline.lua",
        config = {},
        dependencies = {
            "kyazdani42/nvim-web-devicons"
        }
    },

    -- which-key
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end,
    },

}
