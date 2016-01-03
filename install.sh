#!/bin/bash

mkdir ~/bin

echo "install general apps"
sudo apt-get update
sudo apt-get install -y \
	go \
	zsh \
	gmrun \
	git \
	mercurial \
	nitrogen \
	silversearcher-ag \
	vim-nox \
	xclip

echo "install bspwm"

echo "install compton dependencies"
sudo apt-get install libx11-dev libxcomposite-dev libxdamage-dev libxfixes-dev libxext-dev \
  libxrender-dev libxrandr-dev libxinerama-dev pkg-config make \
  x11proto-core-dev libpcre3-dev libconfig-dev libdrm-dev libgl1-mesa-dev libdbus-1-dev asciidock
echo "install compton"
if [ ! -d $(HOME)/bin/compton/ ]; then
  git clone https://github.com/gmarik/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim;
  git clone git@github.com:chjj/compton.git $(HOME)/bin/compton
else
  cd $(HOME)/bin/compton && git remote update && git reset --hard origin/master
fi
cd $(HOME)/bin/compton && make && make docs && sudo make install
