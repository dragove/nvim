vim.g.nvim_tree_ignore = {'.git', 'node_modules'}
vim.g.nvim_tree_quit_on_open = 1
require'nvim-tree'.setup {
  update_focused_file = {
    enable = true
  },
  view = {
    auto_resize = true
  }
}

-- Mappings for nvimtree
vim.api.nvim_set_keymap(
  "n", "<C-e>", ":NvimTreeToggle<CR>",
  {
    noremap = true,
    silent = true
  }
)

