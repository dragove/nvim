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
                require("jdtls").setup_dap()
                require("lazyvim.plugins.lsp.keymaps").on_attach(client, bufnr)
            end

            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
            -- calculate workspace dir
            local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

            -- get the current OS
            local os
            if vim.fn.has "mac" == 1 then
                os = "mac"
            elseif vim.fn.has "unix" == 1 then
                os = "linux"
            elseif vim.fn.has "win32" == 1 then
                os = "win"
            end
            -- ensure that OS is valid
            if not os or os == "" then
                return
            end

            -- get the mason install path
            local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
            -- local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
            local config = {
                cmd = {
                    "java",
                    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
                    "-Dosgi.bundles.defaultStartLevel=4",
                    "-Declipse.product=org.eclipse.jdt.ls.core.product",
                    "-Dlog.protocol=true",
                    "-Dlog.level=ALL",
                    "-javaagent:" .. install_path .. "/lombok.jar",
                    "-Xms1g",
                    "--add-modules=ALL-SYSTEM",
                    "--add-opens",
                    "java.base/java.util=ALL-UNNAMED",
                    "--add-opens",
                    "java.base/java.lang=ALL-UNNAMED",
                    "-jar",
                    vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
                    "-configuration",
                    install_path .. "/config_" .. os,
                    "-data",
                    workspace_dir,
                },
                on_attach = on_attach,
                capabilities = capabilities,
                root_dir = vim.fs.dirname(
                    vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle" }, { upward = true })[1]
                ),
                settings = {
                    java = {}
                },
                init_options = {
                    bundles = {
                        vim.fn.glob(
                            require("mason-registry").get_package("java-debug-adapter"):get_install_path()
                            .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"
                        ),
                        -- unpack remaining bundles
                        (table.unpack or unpack)(
                                vim.split(
                                    vim.fn.glob(
                                        require("mason-registry").get_package("java-test"):get_install_path() ..
                                        "/extension/server/*.jar"
                                    ),
                                    "\n",
                                    {}
                                )
                            ),
                    },
                },
                filetypes = { "java" },
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
