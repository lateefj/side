set -xg C_INCLUDE_PATH /usr/include/ /usr/include/x86_64-linux-gnu/
if test -e $HOME/local/zig
  set -xg PATH $PATH $HOME/local/zig 
end
