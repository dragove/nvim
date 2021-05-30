require('init-plugins')
require('init-icons')
require('init-misc')
require('init-buffer')
require('init-statusline')
require('init-lspconf')
require('init-treesitter')
require('init-compe')
require('init-telescope')
require('init-tree')

-- setup themes and non config plugins
require('zephyr')

local cmd = vim.cmd
local g = vim.g

-- setup space as leader key
g.mapleader = ' '
-- disable auto save
g.auto_save = 0
-- enable terminal transparent
cmd 'hi Normal guibg=NONE ctermbg=NONE'

g.indentLine_enabled = 1

