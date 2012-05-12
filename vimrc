" based on http://github.com/jferris/config_files/blob/master/vimrc

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" start to setup vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

if filereadable(expand("~/.vim/filetypes.vim"))
  source ~/.vim/plugins.vim
endif

filetype plugin indent on
" \ is the leader character
let mapleader = ","
syntax on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set number                     " Show line number
set ruler                      " Show ruler
set encoding=utf-8             " Enable utf-8 encoding by default
set nobackup                   " Disable backup file
set nowritebackup
set noswapfile                 " Disable swap file
set undofile                   " Enable undofile
set undodir=/tmp               " Set the undo destination to tmp
set undolevels=700             " Set how many undo vim has to remember
set autoread                   " Set autoread when a file is changed from outside
set history=1000 	             " Sets how many lines of history vim has to remember
set so=7                       " Set 7 lines to the cursor when moving vertical
set textwidth=79               " Default maximum textwidth is 79
set colorcolumn=80,120         " Highlight column 80 and 120 to remind us that we should open a new line
set cmdheight=1                " Commandbar height
set hid                        " Change buffer without saving

set hlsearch
set incsearch       " incremental searching
set ignorecase      " ignore case when searching
set smartcase
"remove highlight when press enter
nnoremap <CR> :noh<CR><CR>

set nowrap " Switch wrap off for everything
set autoindent		" always set autoindenting on

if has("folding")
  set foldenable
  set foldmethod=syntax
  set foldlevel=1
  set foldnestmax=2
  set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '
endif

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftround                 " When at 3 spaces and I hit >> , go to nearest tabstop/shiftwidth
set shiftwidth=2
set expandtab

" Status bar
set showcmd
set modelines=0
set laststatus=2
set showmode
set showmatch
set gdefault
set cursorline
set hidden
set scrolloff=5     " keep 5 lines when scrolling
set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)"

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
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,*.pyc,.svn,vendor/gems/*

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

" Automatically load .vimrc source when saved
autocmd BufWritePost .vimrc source $MYVIMRC

" NERDTree
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\docs' , '\htmlcov']
let NERDTreeHighlightCursorline=1
let NERDTreeChDirMode = 2

" Theme
set background=dark
colorscheme vividchalk

if filereadable(expand("~/.vim/filetypes.vim"))
  source ~/.vim/filetypes.vim
endif

if filereadable(expand("~/.vim/keymaps.vim"))
  source ~/.vim/keymaps.vim
endif

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
