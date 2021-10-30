vim.g.nvim_tree_quit_on_open = 1
require('nvim-tree').setup({
  update_focused_file = {
    enable = true
  },
  view = {
    auto_resize = true
  },
  filters = {
    custom = {'.git', 'node_modules'}
  }
})

-- Mappings for nvimtree
vim.api.nvim_set_keymap(
  "n", "<C-e>", ":NvimTreeToggle<CR>",
  {
    noremap = true,
    silent = true
  }
)

