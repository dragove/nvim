-- split to the right in vsplit
vim.o.splitright = true
-- Split to the bottom in split
vim.o.splitbelow = true
-- Enable mouse for any mode
vim.o.mouse = "a"
vim.o.writebackup = false
vim.o.termguicolors = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.expandtab = true
-- Show line number
vim.o.number = true
-- Highlight current line number
vim.o.cursorline = true
-- Display long text in one line
vim.o.wrap = false
-- Show sign column (e.g. lsp Error sign)
vim.o.signcolumn = "yes"
-- Better completion
vim.o.completeopt = "menu,menuone,noselect"

-- setup space as leader key
vim.g.mapleader = " "

-- set up themes
require("doom-one").setup({
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

-- Highlight on yank
vim.cmd([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
