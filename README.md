# side (Shell Integrated Development Environment)

This is a project to document configuration and usage of shell as an IDE. The current set of tools that I use is fish + vim + tmux (neovim if it is installed).

## Install 
1. First in stall [fish](https://fishshell.com/) + [fisherman](http://fisherman.sh/).
1. Second vim is installed by default on most dev machines but [neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim) is works great and is very fast.
1. Checkout side: git clone git@github.com:lateefj/side.git
1. Link fish config and vimrc
1. Run Post install


### OS X

```bash
brew install fish neovim
chsh /usr/local/bin/fish
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

```

### Run post install script

```
# Install fisher
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

fisher install git_util
fisher install git_is_dirty
fisher install segment

mkdir -p $HOME/.vim/backup_files
mkdir -p $HOME/.vim/swap_files
mkdir -p $HOME/.vim/undo_files
mkdir $HOME/.side
mkdir -p $HOME/.vim/bundle/
```


## Configuration

To extend the existing slide configuration simply drop configuration exertions into $HOME/.side.

* $HOME/.side/vimrc to customize vim 
* $HOME/.side/config.fish to extends fish shell
