local dap = require(("dap"))
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

vim.keymap.set("n", "<F5>", require("dap").continue)
vim.keymap.set("n", "<F7>", require("dap").step_into)
vim.keymap.set("n", "<F8>", require("dap").step_over)
vim.keymap.set("n", "<S-F8>", require("dap").step_out)
vim.keymap.set("n", "<Leader>db", require("dap").toggle_breakpoint)
vim.keymap.set("n", "<Leader>dB", function()
    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<Leader>dr", require "dapui".toggle)

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
