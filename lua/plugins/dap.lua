-- dap support
return {
    "rcarriga/nvim-dap-ui",
    keys = {
        { "<Leader>dr",
            function() require("dapui").toggle({}) end,
            { noremap = true, silent = true, desc = "Toggle dapui" } },
        { "<F5>", function() require("dap").continue() end, desc = "Debug continue" },
        { "<F9>", function() require("dap").run_to_cursor() end, desc = "Debug run to cursor" },
        { "<F10>", function() require("dap").step_over() end, desc = "Debug step ove" },
        { "<F11>", function() require("dap").step_into() end, desc = "Debug step into" },
        { "<F12>", function() require("dap").step_out() end, desc = "Debug  step out" },
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Debug toggle breakpoint" },
        { "<leader>dB",
            function()
                require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            desc = "Debug toggle conditional breakpoint" },
        { "<leader>dr", function() require("dap").repl.open() end, desc = "Debug open repl" }
    },
    config = function()
        local dap = require(("dap"))
        require("dapui").setup()
        require("nvim-dap-virtual-text").setup({})

        dap.adapters.python = {
            type = "executable",
            command = "python",
            args = { "-m", "debugpy.adapter" },
        }

        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    return "/usr/bin/python"
                end,
            },
        }
    end,
    dependencies = {
        { "mfussenegger/nvim-dap" },
        { "theHamsta/nvim-dap-virtual-text" }
    },
}
