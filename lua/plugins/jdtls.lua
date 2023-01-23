-- java lsp
return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
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

        local home = os.getenv("HOME")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        local workspace_dir = home .. "/Workspace/Java/.workspace/" .. project_name
        local config = {
            cmd = { "jdtls", "-data", workspace_dir },
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml" }, { upward = true })[1]),
        }
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                require("jdtls").start_or_attach(config)
            end
        })
    end,
}
