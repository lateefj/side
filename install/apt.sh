#!/bin/bash
sudo apt install -y git fish gcc neovim vim fuse tmux mercurial \
 make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev python-openssl git \
  htop sysstat libbluetooth-dev hugo

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt update

sudo apt install neovim xz-utils -y
mkdir -p $HOME/local/zls && cd $HOME/local/zls && curl -L https://github.com/zigtools/zls/releases/download/0.9.0/x86_64-linux.tar.xz | tar -xJ --strip-components=1 -C .
