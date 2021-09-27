require'nvim-tree'.setup {}

-- Mappings for nvimtree
vim.api.nvim_set_keymap(
  "n", "<C-e>", ":NvimTreeToggle<CR>",
  {
    noremap = true,
    silent = true
  }
)

