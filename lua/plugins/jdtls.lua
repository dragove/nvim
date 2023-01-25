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

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
        -- calculate workspace dir
        local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name
          -- get the mason install path
        local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
        -- local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
        local config = {
            cmd = {
                install_path .. "/bin/jdtls",
                "-javaagent:" .. install_path .. "/lombok.jar",
                "-data",
                workspace_dir
            },
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]),
        }
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                require("jdtls").start_or_attach(config)
            end
        })
    end,
}
