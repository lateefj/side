# Love path
set -xg love /Applications/love.app/Contents/MacOS/love
if test -e $love
  set -g PATH $PATH 
end 

set pg_path /Applications/Postgres.app/Contents/Versions/latest
set pg_bin_path /Applications/Postgres.app/Contents/Versions/latest/bin

if test -e $pg_bin_path
  set -g PATH $pg_bin_path $PATH
  set -g C_INCLUDE_PATH $pg_path/include $C_INCLUDE_PATH 
  set -g LIBRARY_PATH $pg_bin_path/lib $LIBRARY_PATH
end
