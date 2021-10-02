require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  indent = { enable = true },
  -- auto tag with nvim-ts-autotag
  autotag = { enable = true },
  highlight = { enable = true }
}
