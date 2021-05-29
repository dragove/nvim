require('plugins')
require('file-icons')
require('misc')
require('buffer-conf')
require('statusline')
require('lspconf')
require('completion')
require('ts-conf')
require('telescope-conf')
require('tree-conf')
require('zephyr')
require('nvim-autopairs').setup()
require('lspkind').init()

local cmd = vim.cmd
local g = vim.g

-- setup space as leader key
g.mapleader = ' '
-- disable auto save
g.auto_save = 0
cmd 'hi Normal guibg=NONE ctermbg=NONE'

-- color scheme
cmd 'syntax on'

local indent = 4
g.indentLine_enabled = 1

