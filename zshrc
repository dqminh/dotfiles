source $HOME/.antigen.zsh

# Load the oh-my-zsh's library.
antigen-lib

# Load zsh plugins
antigen-bundle vundle
antigen-bundle ssh-agent
antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle kennethreitz/autoenv

# Choose a theme
antigen-theme sorin

# Apply
antigen-apply

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

# Customize to your needs...
export NODE_PATH=/usr/local/lib/node_modules
export GOPATH=$HOME/gocode
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATHS
export NODE_PATH=/usr/local/lib/node_modules
export GOPATH=$HOME/gocode
export GOBIN=$GOROOT/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export JRUBY_OPTS='--1.9'
export RLWRAP=`which rlwrap`

export RUBYMINE_HOME=/Applications/RubyMine.app/

# Stop autocorrect
unsetopt correct_all

# load rvmrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Load nvm
source ~/.nvm/nvm.sh

# source rvmrc if it is in the current directory
# rvm fucked up somehow that i'm not sure what to do. But re-sourced rvmrc
# fixed it
[[ -s "$PWD/.rvmrc" ]] && source "$PWD/.rvmrc"
