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
zstyle ':omz:module:terminal' auto-title 'no'

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
zstyle ':omz:module:prompt' theme 'sorin'

# This will make you shout: OH MY ZSHELL!
source "$OMZ/init.zsh"

# ALIAS
alias rake="noglob rake"
alias vim="mvim -v"
alias gl="git log --pretty=format:'%h - %an, %ar : %s'"
alias fspec="rspec --no-drb"
alias reloadrvm="source .rvmrc"
alias gg='git pr && git pom'
alias edit_vim_plugin='vim ~/.vim/plugins.vim'
alias edit_vim_keymap='vim ~/.vim/keymaps.vim'
alias edit_vim_config='vim ~/.vimrc'

# Customize to your needs...
export GOROOT=/usr/local/Cellar/go/1.0.2
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

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

export S3_ACCESS_KEY_ID=AKIAIFXURYRHOOPRAHZQ
export S3_SECRET_ACCESS_KEY=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
export S3_BUCKET=assets.viki-staging
export RUBYMINE_HOME=/Applications/RubyMine.app/
export TRACKER_TOKEN=ecfb03528d22aaf27d487c21d728e131

# Stop autocorrect
unsetopt correct_all

# source rvmrc if it is in the current directory
# rvm fucked up somehow that i'm not sure what to do. But re-sourced rvmrc
# fixed it
[[ -s "$PWD/.rvmrc" ]] && source "$PWD/.rvmrc"
