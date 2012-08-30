set guioptions=aAce
set background=dark

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
