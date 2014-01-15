export USER_NAME=$1

cd /home/$USER_NAME

if [ -d "/usr/local/bin/ag" ]
then
  echo "ag already installed..."
else
  git clone https://github.com/ggreer/the_silver_searcher.git
  cd the_silver_searcher
  ./build.sh && make install
fi

if [ -d "/usr/local/bin/fish" ]
then
  echo "Fish already installed..."
else
  wget http://fishshell.com/files/2.1.0/fish-2.1.0.tar.gz
  tar -zxf fish-2.1.0.tar.gz && cd fish-2.1.0
  ./configure --prefix=/usr/local
  make && make install
  echo '/usr/local/bin/fish' | tee -a /etc/shells
  chsh -s /usr/local/bin/fish
fi

cd /home/$USER_NAME
mkdir -p .ssh
mkdir -p .config/fish

ln -sf /home/$USER_NAME/.dotfiles/ackrc /home/$USER_NAME/.ackrc
ln -sf /home/$USER_NAME/.dotfiles/tmux.conf /home/$USER_NAME/.tmux.conf
ln -sf /home/$USER_NAME/.dotfiles/vim /home/$USER_NAME/.vim
ln -sf /home/$USER_NAME/.dotfiles/vimrc /home/$USER_NAME/.vimrc
ln -sf /home/$USER_NAME/.dotfiles/ctags /home/$USER_NAME/.ctags
ln -sf /home/$USER_NAME/.dotfiles/gitconfig /home/$USER_NAME/.gitconfig
ln -sf /home/$USER_NAME/.dotfiles/gitignore_global /home/$USER_NAME/.gitignore_global
ln -sf /home/$USER_NAME/.dotfiles/config.fish /home/$USER_NAME/.config/fish/config.fish


if [ -f "/home/$USER_NAME/.vim/bundle/vundle" ]
then
  echo "vundle already installed"
else
  git clone https://github.com/gmarik/vundle.git /home/$USER_NAME/.vim/bundle/vundle
fi
vim +BundleInstall +qall
