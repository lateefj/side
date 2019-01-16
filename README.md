# side (Shell Integrated Development Environment)

This is a project to document configuration and usage of shell as an IDE. The current set of tools that I use is fish + vim + tmux (neovim if it is installed).

## Install 
1. First in stall [fish](https://fishshell.com/) + [fisherman](https://github.com/jorgebucaran/fisher).
1. Second vim is installed by default on most dev machines but [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) is works great and is very fast.
1. Checkout side: git clone git@github.com:lateefj/side.git
1. Link fish config and vimrc
1. Run Post install


### OS X

```bash
brew install fish neovim
brew install reattach-to-user-namespace
brew install vim --with-lua --with-python --with-wrap-pbcopy-and-pbpaste
chsh -s /usr/local/bin/fish -u $USER
```

### Checkout side

```bash
git clone git@github.com:lateefj/side.git
```

### Link Fish config

```bash
rm $HOME/.config/fish/config.fish
ln -s $HOME/side/config.fish $HOME/.config/fish/config.fish
ln -s $HOME/side/vimrc $HOME/.vimrc
ln -s $HOME/side/vimrc $HOME/.vimrc
mkdir -p ~/.config/nvim
ln -s $HOME/side/vimrc $HOME/.config/nvim/init.vim
ln -s $HOME/.vim $HOME/.nvim
```

### Run post install script

```
# Install fisher
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Neovim plug install
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall
vim +GoInstallBinaries
gometalinter --install
fisher add pyenv
fisher add segment
fisher add fishpkg/fish-git-util

mkdir -p $HOME/.vim/backup_files
mkdir -p $HOME/.vim/swap_files
mkdir -p $HOME/.vim/undo_files
mkdir $HOME/.side
```

## Window Manager

OS X [http://www.hammerspoon.org](http://www.hammerspoon.org)

```bash
if [ "$(uname)" == "Darwin" ]; then
  [ -f $HOME/.hammerspoon ] || mkdir -p $HOME/.hammerspoon
  # Simlink the configuration and add a require to include the functionality
  [ -f $HOME/.hammerspoon/hammerspoon.lua ] || ln -s $HOME/side/hammerspoon.lua $HOME/.hammerspoon/side.lua && echo 'require("side")' >> $HOME/.hammerspoon/init.lua
fi
```

Linux / BSD

Awsome WM

```bash

mkdir -p  ~/.config/awesome/
ln -s $HOME/side/awesome.lua $HOME/.config/awesome/awesome.lua && echo 'require("side")' >> $HOME/.config/awesome/side.lua
```


## Configuration

To extend the existing slide configuration simply drop configuration exertions into $HOME/.side.

* $HOME/.side/vimrc to customize vim 
* $HOME/.side/config.fish to extends fish shell
