cd /home/$USERNAME

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

if [ -f "/home/$USER_NAME/.config/fish/config.fish" ]
then
  echo "Dotfiles already installed..."
else
  cd /home/$USER_NAME
  mkdir -p .ssh
  mkdir -p .config/fish

  ln -s /home/$USER_NAME/.dotfiles/ackrc /home/$USERNAME/.ackrc
  ln -s /home/$USER_NAME/.dotfiles/tmux.conf /home/$USERNAME/.tmux.conf
  ln -s /home/$USER_NAME/.dotfiles/vim /home/$USERNAME/.vim
  ln -s /home/$USER_NAME/.dotfiles/vimrc /home/$USERNAME/.vimrc
  ln -s /home/$USER_NAME/.dotfiles/ctags /home/$USERNAME/.ctags
  ln -s /home/$USER_NAME/.dotfiles/gitconfig /home/$USERNAME/.gitconfig
  ln -s /home/$USER_NAME/.dotfiles/gitignore_global /home/$USERNAME/.gitignore_global
  ln -s /home/$USER_NAME/.dotfiles/config.fish /home/$USERNAME/.config/fish/config.fish
fi


if [ -f "/home/$USER_NAME/.vim/bundle/vundle" ]
  git clone https://github.com/gmarik/vundle.git /home/$USERNAME/.vim/bundle/vundle
  vim +BundleInstall +qall
fi
