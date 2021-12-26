local dap = require("dap")
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<F5>", '<CMD>lua require"dap".continue()<CR>', opts)
vim.api.nvim_set_keymap("n", "<F7>", '<CMD>lua require"dap".step_into()<CR>', opts)
vim.api.nvim_set_keymap("n", "<F8>", '<CMD>lua require"dap".step_over()<CR>', opts)
vim.api.nvim_set_keymap("n", "<S-F8>", '<CMD>lua require"dap".step_out()<CR>', opts)
vim.api.nvim_set_keymap("n", "<Leader>db", '<CMD>lua require"dap".toggle_breakpoint()<CR>', opts)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>dB",
    '<CMD>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
    opts
)
vim.api.nvim_set_keymap("n", "<Leader>dr", '<CMD>lua require"dapui".toggle()<CR>', opts)

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
