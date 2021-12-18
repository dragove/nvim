vim.o.splitright    = true      -- split to the right in vsplit
vim.o.splitbelow    = true      -- Split to the bottom in split
vim.o.mouse         = 'a'       -- Enable mouse for any mode
vim.o.writebackup   = false
vim.o.termguicolors = true
vim.o.tabstop       = 2
vim.o.shiftwidth    = 2
vim.o.smartindent   = true
vim.o.expandtab     = true
-- Better completion
vim.o.completeopt   = 'menu,menuone,noselect'

vim.wo.number       = true      -- Show line number
vim.wo.cursorline   = true      -- Highlight current line number
vim.wo.wrap         = false     -- Display long text in one line
vim.wo.signcolumn   = 'yes'

-- set up themes
require('doom-one').setup({
  transparent_background = true,
  plugins_integrations = {
      bufferline = true,
      gitsigns = true,
      telescope = true,
      neogit = false,
      nvim_tree = true,
      dashboard = false,
      startify = false,
      whichkey = true,
      indent_blankline = true,
      vim_illuminate = false,
      lspsaga = true,
  },
})

-- setup space as leader key
vim.g.mapleader = ' '

-- Highlight on yank
vim.cmd(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])

