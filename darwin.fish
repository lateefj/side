# Love path
set -xg love /Applications/love.app/Contents/MacOS/love
if test -e $love
  set -xg PATH $PATH 
end 
