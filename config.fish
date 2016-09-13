
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
. $fisher_home/config.fish

# Set SIDE_HOME env
set -xg SIDE_HOME $HOME/side

# GO
set -xg GOPATH $HOME
# Set envionment variables
set -xg PATH $PATH $HOME/bin $HOME/go/bin $HOME/local/bin

# Fortran
set -xg FFLAGS -ff2c

set -x PLATFORM (uname)

switch $PLATFORM
  case Linux
    source $SIDE_HOME/linux.fish
  case Darwin
    source $SIDE_HOME/darwin.fish
end



# Mercurial
function hs
  hg status
end

# Git
function gs
  git status
end


set pyenv_exists (which pyenv)
if [ $pyenv_exists ];  test -x $pyenv_exists
  . (pyenv init - | psub)
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

set -U EDITOR (which_editor)

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

# NIX
if test -e $HOME/.nix-profile/etc/profile.d/nix.sh
#eval (bash -c "source ~/.nix-profile/etc/profile.d/nix.sh; fish --command 'echo set -x NIX_PATH \"\$NIX_PATH\"\;; echo set -x PATH \"\$PATH\"\;; echo set -x SSL_CERT_FILE \"\$SSL_CERT_FILE\"'")
end
