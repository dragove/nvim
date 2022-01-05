require("toggleterm").setup({
    size = 15,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "single",
        height = 100,
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})
