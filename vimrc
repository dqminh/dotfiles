" based on http://github.com/jferris/config_files/blob/master/vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set encoding=utf-8

" start to setup vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

if filereadable(expand("~/.vim/plugins.vim"))
  source ~/.vim/plugins.vim
endif

filetype plugin on
filetype plugin indent on
" \ is the leader character
let mapleader = ","
syntax on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Use system clipboard
set clipboard+=unnamed

set number                     " Show line number
set encoding=utf-8             " Enable utf-8 encoding by default
set nobackup                   " Disable backup file
set nowritebackup
set noswapfile                 " Disable swap file
set undofile                   " Enable undofile
set undodir=/tmp               " Set the undo destination to tmp
set undolevels=700             " Set how many undo vim has to remember
set autoread                   " Set autoread when a file is changed from outside
set history=1000               " Sets how many lines of history vim has to remember
set so=7                       " Set 7 lines to the cursor when moving vertical
set textwidth=79               " Default maximum textwidth is 79
set colorcolumn=80,120         " Highlight column 80 and 120 to remind us that we should open a new line
set cmdheight=1                " Commandbar height
set hid                        " Change buffer without saving
set switchbuf=useopen          " Use opened buffer instead of creating new one

" Folding
set foldlevelstart=99
set foldmethod=manual

set hlsearch
set incsearch       " incremental searching
set ignorecase      " ignore case when searching
set smartcase
"remove highlight when press enter
nnoremap <CR> :noh<CR><CR>

set nowrap
set autoindent

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftround                 " When at 3 spaces and I hit >> , go to nearest tabstop/shiftwidth
set shiftwidth=2
set expandtab

" Status bar
set modelines=0
set showmode
set showmatch
set gdefault

" Speedup rendering alot
set hidden
set scrolloff=5     " keep 5 lines when scrolling

set laststatus=2

if has('cmdline_info')
  set ruler                   " show the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
  set showcmd                 " show partial commands in status line and selected characters/lines in visual mode
endif

set shortmess=atI   " Abbreviate messages
set fo=tcrqo " t autowraps text using textwidth
             " c autowraps comments using textwidth
             " r autoinserts the current comment leader
             " q allows formatting of comments
             " o auto insert comment leader when press o or O

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Turn on wildmenu
set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.obj,.git,*.rbc,*.class,*.pyc,.svn,vendor/gems/*

" Numbers
set number
set numberwidth=5

" Tags
set tags=./tags;

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\docs' , '\htmlcov']
let NERDTreeHighlightCursorline=1
let NERDTreeChDirMode = 2

" SuperTab
let g:SuperTabCrMapping=0

" Indent guide
let g:indent_guides_enable_on_vim_startup = 1

" Clojure
let vimclojure#HighlightBuiltins=1

" vim-ruby
let ruby_no_expensive=1

"CtrlP
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let g:ctrlp_max_height = 20
let g:ctrlp_extensions = ['tag', 'line', 'buffertag']
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_cmd = 'CtrlPLastMode'

"Ack.vim
let g:ackprg="ag -i --nocolor --nogroup --column"

" Remove whitespace on save
autocmd FileType c,go,python,ruby,javascript,coffeescript,html autocmd BufWritePre <buffer> :%s/\s\+$//e

autocmd QuickFixCmdPost *grep* cwindow " Open quickfix after grep

" Autocomplete
" Enable omni completion.
set complete-=i
set completeopt=menu,menuone,longest " no scratch
set iskeyword+=- " do not use - as a word separator

" Powerline
let g:Powerline_symbols = 'fancy'

" Vimux
let g:VimuxHeight = 10
let VimuxUseNearestPane = 1

" Buffergator
let g:buffergator_viewport_split_policy="T"

" Rails projection
let g:rails_gem_projects = {
      \ "active_model_serializers": {
      \   "app/serializers/*_serializer.rb": {
      \     "command": "serializer",
      \     "affinity": "model"}},
      \ "factory": {
      \   "spec/factories/*_factory.rb": {
      \     "command": "factory",
      \     "affinity": "model",
      \     "alternate": "app/models/%s.rb"}}}

" Theme
set ttyfast
set background=dark
set lazyredraw
colorscheme jellybeans
let g:Powerline_symbols = 'fancy'

" % to bounce from do to end etc.
runtime! macros/matchit.vim

if filereadable(expand("~/.vim/filetypes.vim"))
  source ~/.vim/filetypes.vim
endif

if filereadable(expand("~/.vim/keymaps.vim"))
  source ~/.vim/keymaps.vim
endif

if filereadable(expand("~/.vim/functions.vim"))
  source ~/.vim/functions.vim
endif

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
