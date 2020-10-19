call plug#begin('~/.config/nvim/plugged')
" Show status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Better vim autocompletions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fuzzy File Finder
Plug 'junegunn/fzf.vim'
" ranger file explorer plugin
Plug 'kevinhwang91/rnvimr'
" Pair brackets
Plug 'jiangmiao/auto-pairs'
" Snippets
Plug 'honza/vim-snippets'
" Float Terminal
Plug 'voldikss/vim-floaterm'


call plug#end()

source ~/.config/nvim/config/coc.vim
source ~/.config/nvim/config/misc.vim
source ~/.config/nvim/config/ranger.vim
