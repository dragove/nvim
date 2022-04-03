# NEOVIM CONFIG WITH PURE LUA

## Prerequisite

1. [neovim](https://github.com/neovim/neovim) 0.5 for lua support and native-lsp support
2. [bat](https://github.com/sharkdp/bat) for preview text in telescope search dialog
3. [fd](https://github.com/sharkdp/fd) for find files by file name
4. [ripgrep](https://github.com/BurntSushi/ripgrep) for find files by contents in files
5. patched fonts. (e.g. [nerd-fonts](https://github.com/ryanoasis/nerd-fonts))

## Installation

1. install packer.nvim via `git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
2. clone this repo to personal neovim config folder (e.g. $HOME/.config/nvim)
3. launch neovim via command `nvim`
4. invoke command `:PackerSync` in neovim and wait for plugin installings
5. relaunch neovim and the treesitter plugin will automatically download all matained json files for better highlighting.
6. for LSP supports, you need to install different lsp servers by yourself and add them to `init-lspconf.lua`

## LSP servers

I'm currently using Archlinux with [paru](https://github.com/Morganamilo/paru) as my AUR helper. For installing language servers, you can use scripts below.

```shell
sudo pacman -S clang
sudo pacman -S pyright
sudo pacman -S lua-language-server
sudo pacman -S bash-language-server
paru -S jdtls
```

