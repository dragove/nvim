require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
    },
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
})

-- Mappings for nvimtree
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {
    noremap = true,
    silent = true,
})
