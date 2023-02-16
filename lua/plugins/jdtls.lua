-- java lsp
return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            setup = {
                -- disable jdtls config from lspconfig
                jdtls = function()
                    return true
                end,
            }
        }
    },
    {
        "mfussenegger/nvim-jdtls",
        ft = "java",
        config = function()
            local on_attach = function(client, bufnr)
                require("lazyvim.plugins.lsp.keymaps").on_attach(client, bufnr)
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
                    "--jvm-arg=-javaagent:" .. install_path .. "/lombok.jar",
                    "-data",
                    workspace_dir,
                },
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = vim.fs.dirname(
                    vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
                ),
            }
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    require("jdtls").start_or_attach(config)
                end,
            })
        end,
    }
}
