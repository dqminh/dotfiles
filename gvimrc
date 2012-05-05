set guioptions=aAce
set background=dark
set guifont=Monaco:h13

" Include user's local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
