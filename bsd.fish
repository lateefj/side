set -xg LC_ALL C
set -xg LANG en_US.UTF-8

set -xg LD_LIBRARY_PATH $LD_LIBRARY_PATH /usr/local/lib
set -xg LIBRARY_PATH $LD_LIBRARY_PATH
function mxv
  mixer vol $argv
end

function tmux 
	exec tmux -u $argv
end
# Go Installed
if test -e $HOME/local/go/bin
  set -xg PATH $PATH $HOME/local/go/bin
end


