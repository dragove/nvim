local nvim_lsp = require("lspconfig")
local saga = require("lspsaga")

saga.init_lsp_saga()

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
-- Only jump to error
vim.keymap.set("n", "[D", function()
    require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]D", function()
    require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
-- Code Quickfix
vim.keymap.set("n", "<leader>cq", vim.diagnostic.setloclist, opts)
-- Code Outline
vim.keymap.set("n", "<leader>co", "<cmd>LSoutlineToggle<CR>", { silent = true })

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<leader>wl", function()
        vim.inspect(vim.lsp.buf.list_workspace_folders())
    end, bufopts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
    vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, bufopts)
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "clangd", "pylsp", "gopls", "tsserver", "bashls" }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

-- setup for lua language server
nvim_lsp.sumneko_lua.setup({
    cmd = { "lua-language-server", "-E", "/usr/share/lua-language-server/main.lua" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

nvim_lsp.html.setup({
    cmd = { "vscode-html-languageserver", "--stdio" },
    filetypes = { "html", "htmldjango" },
    on_attach = on_attach,
    capabilities = capabilities,
})

nvim_lsp.cssls.setup({
    cmd = { "vscode-css-languageserver", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
})

nvim_lsp.jsonls.setup({
    cmd = { "vscode-json-languageserver", "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
})
