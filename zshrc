source $HOME/.antigen.zsh

# Load the oh-my-zsh's library.
antigen-lib

# Load zsh plugins
antigen-bundle ssh-agent
antigen-bundle zsh-users/zsh-history-substring-search

# Choose a theme
antigen-theme sorin

# Apply
antigen-apply

# Disable auto title
export DISABLE_AUTO_TITLE="true"

# ALIAS
alias rake="noglob rake"
alias gl="git log --pretty=format:'%h - %an, %ar : %s'"
alias fspec="rspec --no-drb"
alias reloadrvm="source .rvmrc"
alias gg='git pr && git pom'
alias edit_vim_plugin='vim ~/.vim/plugins.vim'
alias edit_vim_keymap='vim ~/.vim/keymaps.vim'
alias edit_vim_config='vim ~/.vimrc'
alias z='. ~/bin/z/z.sh'
alias j='z'
alias tn='tmux new -s'
alias ta='tmux a -t'
alias nw='/Applications/node-webkit.app/Contents/MacOS/node-webkit'

# Customize to your needs...
export NODE_PATH=/usr/local/lib/node_modules
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATHS
export NODE_PATH=/usr/local/lib/node_modules
export GOPATH=$HOME/gocode:$GOPATH
export GOBIN=$HOME/gocode/bin
export PATH=$GOBIN:$PATH
export PATH=/opt/packer:$PATH

export JRUBY_OPTS='--1.9'
export RLWRAP=`which rlwrap`

# Stop autocorrect
unsetopt correct_all

# Load nvm
source ~/.nvm/nvm.sh

export PATH=$HOME/bin:$PATH

# bash style delete word
autoload -U select-word-style
select-word-style bash

source ~/.autoenv/activate.sh
