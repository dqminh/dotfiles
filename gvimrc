set guioptions=aAce
set background=dark
set guifont=Inconsolata:h14
set vb

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
