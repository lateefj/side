
set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
. $fisher_home/config.fish

# Set SIDE_HOME enve
set -xg SIDE_HOME $HOME/side

# GO
set -xg GOPATH $HOME
# Set envionment variables
set -xg PATH $PATH $HOME/bin $HOME/go/bin

# Fortran
set -xg FFLAGS -ff2c

set -x PLATFORM (uname)

if [ $PLATFORM = 'Darwin' ]
  source $SIDE_HOME/darwin.fish
end
if [ $PLATFORM = 'Linux' ]
  source $SIDE_HOME/linux.fish
end

function ge
  if [ $PLATFORM = "Linux" ]
    gvim $argv
  else
    mvim $argv
  end
end

function hs
  hg status
end

function gs
  git status
end


function e # use neovim if it exists
  set nvim_path (which nvim)
  if test -f $nvim_path
    nvim -u $HOME/side/vimrc $argv
  else
    vim $argv
  end
end


function fisher_install
  fisher install cmorrell 
end


source $SIDE_HOME/prompt.fish
source $HOME/.side.fish
