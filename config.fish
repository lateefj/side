set fisher_config ~/.config/fisherman

# Set SIDE_HOME env
set -xg SIDE_HOME $HOME/side

# Set a variable to tracks
set -x PLATFORM (uname)

# Set the default editor
set -x EDITOR nvim


# Use vi key binds
fish_vi_key_bindings

switch $PLATFORM
    case Linux
        source $SIDE_HOME/linux.fish
    case Darwin
        source $SIDE_HOME/darwin.fish
    case FreeBSD
        source $SIDE_HOME/bsd.fish
end

# Install a $HOME/local directory for installing local package
if test -e $HOME/local/bin
    set -xg PATH $PATH $HOME/local/bin
end
# Path for binaries installed in home
if test -e $HOME/bin
    set -xg PATH $PATH $HOME/bin
end

# tmux unicode
function utmux
    tmux -u $argv
end

# Set environment variables
if test -e $HOME/bin
    set -xg PATH $PATH $HOME/bin
end
if test -e $HOME/go/bin
    set -xg PATH $HOME/go/bin $PATH
end
if test -e $HOME/local/go/bin
    set -xg PATH $HOME/local/go/bin $PATH
    set -xg GOBIN $HOME/local/bin
end
if test -e $HOME/local/ziglang
    set -xg PATH $HOME/local/ziglang $PATH
end
if test -e $HOME/local/zls
    set -xg PATH $PATH $HOME/local/zls
end

# Fortran
set -xg FFLAGS -ff2c

# Default to optimized compile c code
set -xg CFLAGS -O2

# Mercurial alias 
function hs
    hg status
end

# Git alias
function gs
    git status
end

# Local nim
if test -e $HOME/local/nim
    set -xg PATH $PATH $HOME/local/nim/bin
end

# Dart library installed
if test -e /usr/lib/dart/bin/
    set -xg PATH $PATH /usr/lib/dart/bin/
end

# Minikube 
set minikube_path (which minikube)
if [ $minikube_path ]
    test -x $minikube_path
    function kubectl
        minikube kubectl -- $argv
    end
    eval (minikube docker-env)
end


if test -e $HOME/.pyenv/bin/pyenv
    set -xg PATH $HOME/.pyenv/bin/ $PATH
    set -xg PYENV_VERSION default
end

function initpenv
    # If pyenv exists then run it
    set pyenv_exists (which pyenv)
    if [ $pyenv_exists ]
        test -x $pyenv_exists
        set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
        # pyenv + virtualenv
        status --is-interactive; and pyenv virtualenv-init - | source
        pyenv init - | source

        # Found this saves a lot of startup time (like 40%) by not calling it based on using this command
        # echo '' > startup.txt && nvim --startuptime startup.txt
        if test -z "$VIMRUNTIME"
            pyenv rehash
        end
    end
end

function pyactivate
    initpenv
    pyenv activate $argv
end
# Use neovim if it exists
function which_editor
    set nvim_path (which nvim)
    if [ $nvim_path ]
        test -x $nvim_path
        echo nvim
    else
        echo vim
    end
end

# TODO: Figure this out
function e
    set cmd (which_editor)
    set TERM screen-256color
    eval $cmd $argv
end


# Gui vim
function ge
    switch $PLATFORM
        case Linux
            gvim $argv
        case Darwin
            mvim $argv
    end
end

function ll
    ls -lh $argv
end


function mkenv
    mkdir -p $HOME/.venv
    pyvenv $HOME/.venv/$argv
end

function wrkenv
    source $HOME/.venv/$argv/bin/activate.fish
end


if test -e $SIDE_HOME/prompt.fish
    source $SIDE_HOME/prompt.fish
end
if test -e $HOME/.side/config.fish
    source $HOME/.side/config.fish
end


# Add current path to include path
set -xg C_INCLUDE_PATH . $C_INCLUDE_PATH
# Local zig installation
if test -e $HOME/local/zig/zig
    # Add zig to path
    set -xg PATH $PATH $HOME/local/zig
end


# Set chrome executable if chromium
if test -e /usr/bin/chromium
    set -xg CHROME_EXECUTABLE /usr/bin/chromium
end


function random_string --description "random_string 32"
    switch $PLATFORM
        case Darwin
            head -c $argv[1] </dev/random | base64
        case '*'
            head /dev/urandom | tr -dc A-Za-z0-9 | head -c $argv[1]
            echo ''
    end
end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lateef/local/google-cloud-sdk/path.fish.inc' ]
    . '/Users/lateef/local/google-cloud-sdk/path.fish.inc'
end

# FZF search
set -xg FZF_DEFAULT_COMMAND "rg --files --hidden --follow --glob '!.git'"

