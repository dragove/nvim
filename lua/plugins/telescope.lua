-- mappings
-- fuzzy finder
return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
        { "<Leader>sf", require("telescope.builtin").find_files, desc = "find files" },
        { "<Leader>sg", require("telescope.builtin").live_grep, desc = "global grep" },
        { "<Leader>sb", require("telescope.builtin").buffers, desc = "find buffer" },
        { "<Leader>sh", require("telescope.builtin").help_tags, desc = "find tags" }
    },
    config = function()
        local telescope = require("telescope")
        local action_layout = require("telescope.actions.layout")
        telescope.setup({
            defaults = {
                borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" },
                mappings = {
                    n = {
                        ["<M-p>"] = action_layout.toggle_preview
                    },
                    i = {
                        ["<M-p>"] = action_layout.toggle_preview
                    },
                },
            },
            extensions = {
                media_files = {
                    filetypes = { "png", "webp", "jpg", "jpeg" },
                    find_cmd = "rg",
                },
            },
        })
    end
}
