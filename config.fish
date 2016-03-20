
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
. $fisher_home/config.fish

# Set SIDE_HOME env
set -xg SIDE_HOME $HOME/side

# GO
set -xg GOPATH $HOME
# Set envionment variables
set -xg PATH $PATH $HOME/bin $HOME/go/bin

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

function fisher_install
  fisher install cmorrell 
end

function ll
  ls -lh $argv
end



source $SIDE_HOME/prompt.fish
source $HOME/.side.fish
