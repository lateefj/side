# Peformance issue with Mac OS 12
function __fish_describe_command; end
# Love path
set -xg love /Applications/love.app/Contents/MacOS/love
if test -e $love
  set -g PATH $PATH 
end 

set -xg homebrew_path /opt/homebrew/bin/
if test -e $homebrew_path
  set -g PATH $homebrew_path $PATH
end
set llvm_path /usr/local/opt/llvm/bin
if test -e $llvm_path
  set -g PATH $llvm_path $PATH
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

# Big Sur hack for python
set -gx GRPC_PYTHON_BUILD_SYSTEM_ZLIB true
