ZSH=$HOME/.oh-my-zsh
ZSH_THEME="steeef"

# ALIAS
alias rake="noglob rake"
alias vim="mvim -v"
alias gl="git log --pretty=format:'%h - %an, %ar : %s'"
alias fspec="rspec --no-drb"
alias reloadrvm="source .rvmrc"

DISABLE_AUTO_TITLE="true"
plugins=(history-search-substring encode64)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export EDITOR=vim
export GOROOT=/usr/local/Cellar/go/1.0.1
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# PATHS
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$GOROOT/bin
export PATH=/usr/local/Cellar/python/2.7.3/bin:$PATH
export PATH=/usr/local/share/python:$PATH

export GOPATH=$HOME/gocode
export PYTHONPATH=/usr/local/Cellar/python/2.7.3
export LD_LIBRARY_PATH=/usr/local/Cellar/python/2.7.3/lib:/usr/local/Cellar/python/2.7.3:$LD_LIBRARY_PATH
export LINKFLAGS='-search_dylibs_first -L /usr/local/Cellar/python/2.7.3/lib/'
export PKG_CONFIG_PATH=/usr/local/Cellar/cairo/1.10.2/lib/pkgconfig
export CC=/usr/bin/gcc-4.2
export CPP=/usr/bin/cpp-4.2
export CXX=/usr/bin/g++-4.2
export NODE_PATH=/usr/local/lib/node_modules
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH

export JAVA_HOME="$(/usr/libexec/java_home)"
#export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
#export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
#export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.5.2.5/jars"
export JRUBY_OPTS='--1.9'
export RLWRAP=`which rlwrap`

# Stop autocorrect
unsetopt correct_all

# load rvmrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# load tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
