# Love path
set -xg love /Applications/love.app/Contents/MacOS/love
if test -e $love
  set -g PATH $PATH 
end 
if test -e /Applications/Postgres.app/Contents/Versions/latest/bin
  set -g PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH
end
