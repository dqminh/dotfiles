all: default apps vim

.PHONY: default
default:
	# add aliases for things in bin
	for file in $(shell find $(CURDIR)/bin -type f -not -name "*-backlight" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$f; \
	done

	# add aliases for config
	for file in $(shell find $(CURDIR)/config -mindepth 1 -maxdepth 1 -not -name ".*.swp"); do \
		f=$$(echo $$file | sed -e 's|$(CURDIR)/config||'); \
		ln -sfn $$file $(HOME)/.config/$$f; \
	done

	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done

	for file in $(shell find $(CURDIR)/etc -type f -not -name ".*.swp"); do \
		f=$$(echo $$file | sed -e 's|$(CURDIR)||'); \
		sudo ln -f $$file $$f; \
	done
	systemctl --user daemon-reload
	sudo systemctl daemon-reload

	for file in $(shell find $(CURDIR)/usr -type f -not -name ".*.swp"); do \
		f=$$(echo $$file | sed -e 's|$(CURDIR)||'); \
		sudo ln -f $$file $$f; \
	done

.PHONY: vim
vim: default
	if [ ! -d $(HOME)/.vim/bundle/Vundle.vim ]; then git clone https://github.com/gmarik/Vundle.vim.git $(HOME)/.vim/bundle/Vundle.vim; fi

.PHONY: apps
apps:
	mkdir ~/bin
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

