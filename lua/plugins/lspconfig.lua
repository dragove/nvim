-- lsp support with mason_lspconfig
return {
    "neovim/nvim-lspconfig",
    config = function()
        local on_attach = function(_, bufnr)
            local nmap = function(keys, func, desc)
                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end
            nmap("[D", vim.diagnostic.goto_prev, "previous diagnostic")
            nmap("]D", vim.diagnostic.goto_next, "next diagnostic")
            nmap("gD", vim.lsp.buf.declaration, "Go To Declaration")
            nmap("gd", vim.lsp.buf.definition, "Go To Definition")
            nmap("K", vim.lsp.buf.hover, "Document")
            nmap("gi", vim.lsp.buf.implementation, "Go To Implementation")
            nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
            nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace")
            nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace")
            nmap("<leader>wl", function()
                vim.inspect(vim.lsp.buf.list_workspace_folders())
            end, "List Workspace")
            nmap("<leader>D", vim.lsp.buf.type_definition, "Type Definition")
            nmap("<leader>rn", vim.lsp.buf.rename, "Rename")
            nmap("gr", require("telescope.builtin").lsp_references, "Code Reference")
            nmap("<leader>so", require("telescope.builtin").lsp_document_symbols, "Document Symbol")
            nmap("<leader>cf", vim.lsp.buf.format, "code format")
        end

        local mason_lspconfig = require("mason-lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local servers = {
            clangd = {},
            gopls = {},
            pylsp = {},
            rust_analyzer = {},
            tsserver = {},
            bashls = {},
            sumneko_lua = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        }
        require("neodev").setup()
        require("mason").setup()
        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers)
        })
        mason_lspconfig.setup_handlers {
            function(server_name)
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                }
            end,
        }
        -- Turn on lsp status information
        require("fidget").setup({
            window = {
                blend = 0
            }
        })
    end,
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        "folke/neodev.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "nvim-telescope/telescope.nvim"
    },
}
