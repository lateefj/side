apt install -y git fish gcc neovim vim fuse tmux mercurial \
 make build-essential libssl-dev zlib1g-dev libbz2-dev \
  libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
  xz-utils tk-dev libffi-dev liblzma-dev python-openssl git \
  htop sysstat libbluetooth-dev

sudo add-apt-repository ppa:longsleep/golang-backports
sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt update
sudo apt install -y golang-go
