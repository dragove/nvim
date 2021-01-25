call plug#begin('~/.config/nvim/plugged')

" One dark theme
Plug 'joshdick/onedark.vim'

" syntax-hilight improvement
Plug 'sheerun/vim-polyglot'

" Show status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Better vim autocompletions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Fuzzy File Finder
Plug 'junegunn/fzf.vim'
" Ranger file explorer plugin
Plug 'kevinhwang91/rnvimr'
" Snippets
Plug 'honza/vim-snippets'
" Rainbow parentheses
Plug 'luochen1990/rainbow'
" Rainbow csv
Plug 'mechatroner/rainbow_csv'
" Float Terminal
Plug 'voldikss/vim-floaterm'
" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" Surround
Plug 'tpope/vim-surround'
" Wildfire
Plug 'gcmt/wildfire.vim'
" Easier comment
Plug 'tpope/vim-commentary'
" Easymotion
Plug 'easymotion/vim-easymotion'
" Find the root of a project
Plug 'airblade/vim-rooter'
" Good-looking icons
Plug 'ryanoasis/vim-devicons'
" Plug 'kyazdani42/nvim-web-devicons'
" Better look buffer line
" Plug 'romgrk/barbar.nvim'
" Plugin for plantuml
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

call plug#end()

source ~/.config/nvim/config/coc.vim
source ~/.config/nvim/config/misc.vim
source ~/.config/nvim/config/ranger.vim
source ~/.config/nvim/config/markdown.vim
