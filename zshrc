# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias rake="noglob rake"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(history-search-substring)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export GOROOT=/usr/local/Cellar/go/1.0.1
unsetopt correct_all
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=/usr/bin/vim
export CC=/usr/bin/gcc-4.2
export CPP=/usr/bin/cpp-4.2
export CXX=/usr/bin/g++-4.2
export NODE_PATH=/usr/local/lib/node_modules

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$GOROOT/bin
