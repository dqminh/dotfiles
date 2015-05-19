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
alias gl="PAGER=cat git log --pretty=format:'%h - %an, %ar : %s'"
alias tn='tmux new -s'
alias ta='tmux a -t'
alias tl='tmux list-sessions'

# Customize to your needs...
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATHS
export GOPATH=$HOME/gocode
export GOBIN=$HOME/gocode/bin
export PATH=$HOME/bin:$HOME/.bin:$GOBIN:/opt/packer:/usr/local/go/bin:$PATH
export PATH=$HOME/.bin:$PATH

# tools for moving around GOPATH
export CDPATH=$HOME/gocode/src/github.com:$HOME/gocode/src/code.google.com/p
gocd () { cd `go list -f '{{.Dir}}' $1` }

# Stop autocorrect
unsetopt correct_all

# bash style delete word
autoload -U select-word-style
select-word-style bash

if [ -f $HOME/.autoenv/activate.sh ]; then
  source $HOME/.autoenv/activate.sh
fi

if [ -d $HOME/google-cloud-sdk ]; then
  # The next line updates PATH for the Google Cloud SDK.
  source '/home/action/google-cloud-sdk/path.zsh.inc'

  # The next line enables bash completion for gcloud.
  source '/home/action/google-cloud-sdk/completion.zsh.inc'
fi

if [ -d $HOME/.boot2docker ]; then
  export DOCKER_TLS_VERIFY=1
  export DOCKER_HOST=tcp://192.168.59.103:2376
  export DOCKER_CERT_PATH=/Users/dqminh/.boot2docker/certs/boot2docker-vm
fi
