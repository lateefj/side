set -xg LC_ALL C

function mxv
  mixer vol $argv
end

# Go Installed
if test -e $HOME/local/go/bin
  set -xg PATH $PATH $HOME/local/go/bin
end

