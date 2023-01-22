local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- lua functions
    "nvim-lua/plenary.nvim",
    -- icons for other plugins
    {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
    },
    -- termial integration
    {
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("init-term")
        end,
    },
    -- notification manager
    {
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
            -- hardcoded background color
            vim.notify.setup({ background_colour = "#282c34" })
        end
    },

    -- motion plugin
    "tpope/vim-repeat",
    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").add_default_mappings()
        end
    },

    -- surround support
    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end
    },

    -- markdown support
    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast"
    },

    -- auto completion
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("init-cmp")
        end,
        dependencies = {
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-cmdline" },
            { "hrsh7th/cmp-nvim-lsp" },
            -- snippet support
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" }
        },
    },
    -- lsp support
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("init-lspconf")
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        branch = "main"
    },
    "ray-x/lsp_signature.nvim",
    -- null-ls for missing ls functionalities
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("init-null-ls")
        end,
    },
    -- java lsp
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        config = function()
            require("init-jdtls")
        end,
    },
    -- dap support
    {
        "rcarriga/nvim-dap-ui",
        config = function()
            require("init-dap")
        end,
        dependencies = {
            { "mfussenegger/nvim-dap" },
            { "theHamsta/nvim-dap-virtual-text" }
        },
    },
    -- treesitter config
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("init-treesitter")
        end,
    },
    -- automatic highlight current symbol
    "RRethy/vim-illuminate",
    -- better matchup which can be intergreted to treesitter
    "andymass/vim-matchup",
    -- show scope
    "nvim-treesitter/nvim-treesitter-context",
    -- better lisp editing
    {
        "eraserhd/parinfer-rust",
        build = "cargo build --release"
    },
    -- auto pairs
    "windwp/nvim-autopairs",
    -- auto tags
    "windwp/nvim-ts-autotag",
    -- rainbow
    "p00f/nvim-ts-rainbow",
    -- comment
    {
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup({
                hook = function()
                    require("ts_context_commentstring.internal").update_commentstring()
                end,
            })
        end,
        dependencies = { { "JoosepAlviste/nvim-ts-context-commentstring" } }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("init-indent")
        end,
    },

    -- color scheme
    {
        "olimorris/onedarkpro.nvim",
        event = "BufEnter",
        config = function()
            require("init-theme")
        end,
    },

    -- status line
    {
        "windwp/windline.nvim",
        config = function()
            require("init-windline")
        end,
    },
    -- clickable buffer line
    {
        "akinsho/nvim-bufferline.lua",
        config = function()
            require("bufferline").setup()
        end,
    },
    -- git integration
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("init-gitsigns")
        end,
    },
    -- which-key
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end,
    },

    -- file explorer
    {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("init-tree")
        end,
        dependencies = { { "kyazdani42/nvim-web-devicons" } }
    },
    -- fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("init-telescope")
        end,
    },
    -- media file preview extension for telescope
    "nvim-telescope/telescope-media-files.nvim"

})
