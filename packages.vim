call plug#begin('~/.config/nvim/plugged')
" Show status line
Plug 'vim-airline/vim-airline'
" Better vim autocompletions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" For tree view of files
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Fuzzy File Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" ranger file explorer plugin
Plug 'kevinhwang91/rnvimr'
call plug#end()

source ~/.config/nvim/config/coc.vim
source ~/.config/nvim/config/rnvimr.vim
source ~/.config/nvim/config/ranger.vim
