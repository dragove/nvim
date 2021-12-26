local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- dap
    require("jdtls").setup_dap({ hotcodereplace = "auto" })

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>Lspsaga rename<CR>", opts)
    buf_set_keymap("n", "<space>ca", "<cmd>Lspsaga code_action<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local home = os.getenv("HOME")
local root_markers = { "gradlew", "pom.xml", "mavenw", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
local workspace_folder = home .. "/Workspace/Java/.workspace" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local config = {
    cmd = {
        "jdtls",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-data",
        workspace_folder,
    },
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = root_dir,
    settings = {
        java = {},
    },
}
require("jdtls").start_or_attach(config)
