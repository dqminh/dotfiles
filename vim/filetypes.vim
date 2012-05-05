au BufNewFile,BufRead *.txt setfiletype text
au BufNewFile,BufRead *.json set syntax=javascript ft=javascript
au BufNewFile,BufRead *.hbs set syntax=mustache
au BufNewFile,BufRead *.pde set filetype=c syntax=c cindent
au BufNewFile,BufRead *.html set textwidth=999
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/google-chrome"


autocmd FileType text setlocal textwidth=78
