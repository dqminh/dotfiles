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
alias mn='tmux new -s'
alias mt='tmux a -t'
alias nw='/Applications/node-webkit.app/Contents/MacOS/node-webkit'

# Customize to your needs...
export NODE_PATH=/usr/local/lib/node_modules
export GOPATH=$HOME/gocode
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Functions
# =========
#
# delete an lxc box
function delete-box() {
  sudo lxc-stop -n $1
  sudo umount "/var/lib/lxc/${1}"
  sudo lxc-destroy -n $1
  sudo rm -rf "/var/lib/lxc/${1}_delta"
}

# delete a branch
function delete-branch() {
  git branch -D $1
  git push origin ":${1}"
}

# PATHS
export NODE_PATH=/usr/local/lib/node_modules
export GOPATH=$HOME/gocode
export GOBIN=$GOPATH/bin
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOBIN
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

# Load virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

export PATH=$PATH:$HOME/bin
