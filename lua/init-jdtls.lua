local jdtls = require("jdtls")
-- local on_attach = function(_, bufnr)
--     jdtls.setup.add_commands()
--     jdtls.setup_dap()
--     vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--     local opts = { noremap = true, silent = true, buffer = bufnr }
--     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
--     vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
--     vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set("n", "<leader>wl", function()
--         vim.inspect(vim.lsp.buf.list_workspace_folders())
--     end, opts)
--     vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
--     vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--     vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
--     vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
--     vim.keymap.set("n", "<leader>so", require("telescope.builtin").lsp_document_symbols, opts)
--     vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, opts)
-- end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local home = os.getenv("HOME")
local root_markers = { "gradlew", "pom.xml", "mavenw", ".git" }
local root_dir = jdtls.setup.find_root(root_markers)
local workspace_folder = home .. "/Workspace/Java/.workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
    cmd = {
        "jdtls",
        "-data",
        workspace_folder,
    },
    flags = {
        allow_incremental_sync = true,
    };
    -- on_attach = on_attach,
    -- capabilities = capabilities,
    root_dir = root_dir,
    settings = {
        java = {
        }
    },
}
jdtls.start_or_attach(config)
