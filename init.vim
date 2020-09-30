set number                      " show line number
set hidden
set relativenumber              " show relative line number
set history=1024                " :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set shortmess+=c
set showmode                    " Show current mode down the bottom
" Tab
set expandtab                   " Use spaces instead of tabs
set smarttab                    " Be smart when use tabs
set shiftwidth=2                " Default tab width
set tabstop=2                   " Default tab width

" Encoding
" " User utf-8 as base encoding; but autofit other encoding
set fencs=utf-8,ucs-bom,shift-jis,gb18032,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,unix,dos,mac
set fileencoding=utf-8

" Linebreak
set linebreak                   " Set linebreak
set textwidth=256               " The max textwidth

set mouse=nv

set inccommand=nosplit        " Shows the effects of a command incrementally, as you type. For Neovim.

" Faster
set updatetime=100              " Faster Async update
set timeout timeoutlen=500 ttimeoutlen=256

" Files and backups and undo
": Turn off backup 
set nobackup
set nowritebackup
set noswapfile
set directory=~/.cache/nvim/.undo,~/tmp,/tmp

": Enable  Undo
set undolevels=10240
set undofile
set undodir=~/.cache/nvim/.undo,~/tmp,/tmp

" Keymap Leader
let mapleader=" "
let g:mapleader=" "             " Use space

source ~/.config/nvim/packages.vim
