#!/bin/bash

# To be used on ubuntu
# ssh user@host "wget raw.github.com/dqminh/dotfiles/master/init.sh && chmod +x init.sh && sudo ./init.sh user"

apt-get update
apt-get upgrade -y

export USERNAME=$1

apt-get install -y \
  automake \
  pkg-config \
  libpcre3-dev \
  zlib1g-dev \
  liblzma-dev

apt-get install -y \
  wget \
  curl \
  tmux \
  htop \
  ctags \
  tree

git clone https://github.com/dqminh/dotfiles $HOME/.dotfiles
cd $HOME/.dotfiles
./bootstrap.sh
