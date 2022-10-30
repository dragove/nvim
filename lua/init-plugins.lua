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
            vim.notify.setup({ background_colour = "#282c34" })
        end
    })

    -- easymotion like plugin
    use({
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("init-hop")
        end
    })

    -- surround support
    use({
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup({})
        end
    })

    -- markdown support
    use({
        "preservim/vim-markdown",
        requires = {
            { "godlygeek/tabular" }
        }
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
            { "hrsh7th/cmp-cmdline" },
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
    use({
        "glepnir/lspsaga.nvim",
        branch = "main"
    })
    use("ray-x/lsp_signature.nvim")
    -- null-ls for missing ls functionalities
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("init-null-ls")
        end,
    })
    -- java lsp
    -- dap support
    use({
        "rcarriga/nvim-dap-ui",
        config = function()
            require("init-dap")
        end,
        requires = {
            { "mfussenegger/nvim-dap" },
            { "theHamsta/nvim-dap-virtual-text" }
        },
    })
    -- treesitter config
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("init-treesitter")
        end,
    })
    -- automatic highlight current symbol
    use("RRethy/vim-illuminate")
    -- better matchup which can be intergreted to treesitter
    use("andymass/vim-matchup")
    -- show scope
    use("nvim-treesitter/nvim-treesitter-context")
    -- better lisp editing
    use("eraserhd/parinfer-rust")
    -- auto pairs
    use("windwp/nvim-autopairs")
    -- auto tags
    use("windwp/nvim-ts-autotag")
    -- rainbow
    use("p00f/nvim-ts-rainbow")
    -- comment
    use({
        "terrortylor/nvim-comment",
        config = function()
            require("nvim_comment").setup({
                hook = function()
                    require("ts_context_commentstring.internal").update_commentstring()
                end,
            })
        end,
        requires = { { "JoosepAlviste/nvim-ts-context-commentstring" } }
    })
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
        requires = { { "kyazdani42/nvim-web-devicons" } }
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
