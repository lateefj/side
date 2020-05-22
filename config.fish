set fisher_config ~/.config/fisherman

# Set SIDE_HOME env
set -xg SIDE_HOME $HOME/side

# Set a variable to tracks
set -x PLATFORM (uname)

# Set the default editor
set -x EDITOR vim

# Use vi key binds
fish_vi_key_bindings

switch $PLATFORM
  case Linux
    source $SIDE_HOME/linux.fish
  case Darwin
    source $SIDE_HOME/darwin.fish
  case FreeBSD
    source $SIDE_HOME/bsd.fish
end

# Install a $HOME/local directory for installing local package
if test -e $HOME/local/bin
  set -xg PATH $PATH $HOME/local/bin
end
# Path for binaries installed in home
if test -e $HOME/bin
  set -xg PATH $PATH $HOME/bin 
end

# tmux unicode
function utmux
  tmux -u $argv
end

# GO
set -xg GOPATH $HOME
set -xg GO111MODULE auto

# Set environment variables
if test -e $HOME/go/bin
  set -xg PATH $PATH $HOME/go/bin
end

# Fortran
set -xg FFLAGS -ff2c

# Default to optimized compile c code
set -xg CFLAGS -O2

# Mercurial alias 
function hs
  hg status
end

# Git alias
function gs
  git status
end

# Local nim
if test -e $HOME/local/nim
  set -xg PATH $PATH $HOME/local/nim/bin
end

# Dart library installed
if test -e /usr/lib/dart/bin/
  set -xg PATH $PATH /usr/lib/dart/bin/
end


# Add pyenv to path if installed
if test -e $HOME/.pyenv/bin/pyenv
  set -xg PATH $PATH $HOME/.pyenv/bin
  set -xg  PYENV_ROOT $HOME/.pyenv
end

# If pyenv exists then run it
set pyenv_exists (which pyenv)
if [ $pyenv_exists ];  test -x $pyenv_exists
  source (pyenv init - --no-rehash | psub)
  source (pyenv virtualenv-init - | psub)
  # Found this saves a lot of startup time (like 40%) by not calling it based on using this command
  # echo '' > startup.txt && nvim --startuptime startup.txt
  if test -z "$VIMRUNTIME"
    pyenv rehash
  end
end

# Use neovim if it exists
function which_editor
  set nvim_path (which nvim)
  if [ $nvim_path ];  test -x $nvim_path
    echo nvim
  else
    echo vim
  end
end

# TODO: Figure this out
function e 
  set cmd (which_editor)
  set TERM screen-256color
  eval $cmd $argv
end


# Gui vim
function ge
  switch $PLATFORM
    case Linux
      gvim $argv
    case Darwin
      mvim $argv
  end
end

function ll
  ls -lh $argv
end


function mkenv
  mkdir -p $HOME/.venv
  pyvenv $HOME/.venv/$argv
end

function wrkenv
  source $HOME/.venv/$argv/bin/activate.fish
end


if test -e $SIDE_HOME/prompt.fish
  source $SIDE_HOME/prompt.fish
end
if test -e $HOME/.side/config.fish
  source $HOME/.side/config.fish
end

# TODO: Use nix for package installation?
# NIX
if test -e $HOME/.nix-profile/etc/profile.d/nix.sh
#eval (bash -c "source ~/.nix-profile/etc/profile.d/nix.sh; fish --command 'echo set -x NIX_PATH \"\$NIX_PATH\"\;; echo set -x PATH \"\$PATH\"\;; echo set -x SSL_CERT_FILE \"\$SSL_CERT_FILE\"'")
end


# Android studio if test -e $HOME/local/android-studio/bin
if test -e $HOME/local/android-studio/bin
  set -xg ANDROID_SDK_ROOT $HOME/local/android-studio/bin
  set -xg PATH $PATH $HOME/local/android-studio/bin
end
if test -e $HOME/Android/Sdk/
  set -xg ANDROID_SDK_ROOT $HOME/Android/Sdk/
  set -xg PATH $PATH $HOME/Android/Sdk/tools/
end

# Set chrome executable if chromium
if test -e /usr/bin/chromium
  set -xg CHROME_EXECUTABLE /usr/bin/chromium
end


# The next line updates PATH for the Google Cloud SDK.
if test -e $HOME/local/google-cloud-sdk/path.fish.inc
  source $HOME/local/google-cloud-sdk/path.fish.inc
end

