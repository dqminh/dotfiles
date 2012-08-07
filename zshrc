#
# Sets Oh My Zsh options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:module:editor' keymap 'emacs'

# Auto convert .... to ../..
zstyle ':omz:module:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:module:terminal' auto-title 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':omz:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':omz:load' zfunction 'zargs' 'zmv'

# Set the Oh My Zsh modules to load (browse modules).
# The order matters.
zstyle ':omz:load' omodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'history-substring-search' \
  'prompt'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:module:prompt' theme 'steeef'

# This will make you shout: OH MY ZSHELL!
source "$OMZ/init.zsh"

# ALIAS
alias rake="noglob rake"
alias vim="mvim -v"
alias gl="git log --pretty=format:'%h - %an, %ar : %s'"
alias fspec="rspec --no-drb"
alias reloadrvm="source .rvmrc"

# Customize to your needs...
export GOROOT=/usr/local/Cellar/go/1.0.1
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATHS
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$GOROOT/bin

export GOPATH=$HOME/gocode
export CC=/usr/local/bin/gcc-4.2
export CPPFLAGS="-I/opt/X11/include"
export CFLAGS="-I/opt/X11/include"
export NODE_PATH=/usr/local/lib/node_modules

export JAVA_HOME="$(/usr/libexec/java_home)"
export JRUBY_OPTS='--1.9'
export RLWRAP=`which rlwrap`

# Stop autocorrect
unsetopt correct_all

# load rvmrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# load tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
