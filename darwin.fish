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
set zlibflag /usr/local/opt/zlib
if test -e $zlibflags
  set -gx LDFLAGS "-L$LDFLAGS:$zlibflag/lib"
  set -gx CPPFLAGS "-I$CPPFLAGS:$zlibflag/include"
end
set openssl_path /usr/local/opt/openssl@1.1
if test -e $openssl_path
  set -gx LDFLAGS "-L$LDFLAG:$openssl_path/lib"
  set -gx CPPFLAGS "-I$CPPFLAGS:$openssl_path/include"
end
