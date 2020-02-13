# NVim Config

## Description
This nvim config has both my init.vim script and some settings for the coc
autocompletion and linting image

### Installation
Before installing the config scripts you should already have 
[nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim) installed.

You also need to install [plug](https://github.com/junegunn/vim-plug). This 
will be your plugin manager in nvim.
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Finally to install the config use
```sh
mkdir -p ~/.config/nvim
git clone git@github.com:JonMontgo/nvim-config.git ~/.config/nvim
```
