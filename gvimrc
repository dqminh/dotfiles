set guioptions=aAce
set background=dark
set guifont=Inconsolata:h12
set vb

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
