return require("packer").startup(function(use)
    -- package manager
    use("wbthomason/packer.nvim")

    -- lua functions
    use("nvim-lua/plenary.nvim")
    -- icons for other plugins
    use({
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({ default = true })
        end,
    })
    -- termial integration
    use({
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("init-term")
        end,
    })
    -- notification manager
    use({
        "rcarriga/nvim-notify",
        config = function()
            vim.notify = require("notify")
            -- hardcoded background color
            vim.notify.setup({background_colour = "#282c34"})
        end
    })

    -- auto completion
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            require("init-cmp")
        end,
        requires = {
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-nvim-lsp" },
            -- snippet support
            { "L3MON4D3/LuaSnip" },
            { "saadparwaiz1/cmp_luasnip" }
        },
    })
    -- lsp support
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("init-lspconf")
        end,
    })
    -- null-ls for missing ls functionalities
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("init-null-ls")
        end,
    })
    -- lsp UI staffs
    use("tami5/lspsaga.nvim")
    -- java lsp
    use({
        "mfussenegger/nvim-jdtls",
        ft = { "java" },
        config = function()
            require("init-jdtls")
        end,
    })
    -- dap support
    use({
        "rcarriga/nvim-dap-ui",
        config = function()
            require("init-dap")
        end,
        requires = { { "mfussenegger/nvim-dap" }, { "theHamsta/nvim-dap-virtual-text" } },
    })
    -- treesitter config
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("init-treesitter")
        end,
    })
    -- auto pairs
    use("windwp/nvim-autopairs")
    -- auto tags
    use("windwp/nvim-ts-autotag")
    -- comment
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    -- indent
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("init-indent")
        end,
    })

    -- color scheme
    use({
        "olimorris/onedarkpro.nvim",
        event = "BufEnter",
        config = function()
            require("init-theme")
        end,
    })

    -- status line
    use({
        "windwp/windline.nvim",
        config = function()
            require("init-windline")
        end,
    })
    -- clickable buffer line
    use({
        "akinsho/nvim-bufferline.lua",
        config = function()
            require("bufferline").setup()
        end,
    })
    -- git integration
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("init-gitsigns")
        end,
    })
    -- which-key
    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end,
    })

    -- file explorer
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("init-tree")
        end,
    })
    -- fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        config = function()
            require("init-telescope")
        end,
    })
    -- media file preview extension for telescope
    use("nvim-telescope/telescope-media-files.nvim")
end)
