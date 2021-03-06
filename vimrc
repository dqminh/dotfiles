" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8

"------------------------------------------------------------------------------
" BUNDLES
"------------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'thisivan/vim-bufexplorer'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'godlygeek/tabular'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'

Plugin 'fatih/vim-go'
Plugin 'vim-ruby/vim-ruby'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'nono/vim-handlebars'
Plugin 'pangloss/vim-javascript'
Plugin 'klen/python-mode'
Plugin 'wting/rust.vim'
Plugin 'crosbymichael/vim-cfmt'
Plugin 'flazz/vim-colorschemes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

let mapleader = ","
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" Use system clipboard
" Writes to the unnamed register also writes to the * and + registers. This
" makes it easy to interact with the system clipboard
if has ('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

set number             " Show line number
set encoding=utf-8     " Enable utf-8 encoding by default
set nobackup           " Disable backup file
set nowritebackup
set noswapfile         " Disable swap file
set undofile           " Enable undofile
set undodir=/tmp       " Set the undo destination to tmp
set undolevels=700     " Set how many undo vim has to remember
set autoread           " Set autoread when a file is changed from outside
set history=1000       " Sets how many lines of history vim has to remember
set so=7               " Set 7 lines to the cursor when moving vertical
set textwidth=79       " Default maximum textwidth is 79

set colorcolumn=80,120 " Highlight column 80 and 120 to remind us that we should open a new line
colorscheme jellybeans

set cmdheight=1        " Commandbar height
set hid                " Change buffer without saving
set switchbuf=useopen  " Use opened buffer instead of creating new one
set nowrap
set autoindent
set foldlevelstart=99
set foldmethod=manual
set hlsearch           " Highlight search
set incsearch          " incremental searching
set ignorecase         " ignore case when searching
set smartcase
set tabstop=2
set softtabstop=2
set shiftround
set shiftwidth=2
set expandtab
set modelines=0
set showmode
set showmatch
set gdefault
set scrolloff=5        " keep 5 lines when scrolling
set hidden
set laststatus=2
set number " Show line number
set numberwidth=5 "Max number is 99999
" Resize splits when the window is resized
au VimResized * :wincmd =

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

if has('cmdline_info')
  set ruler
  set showcmd
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

" Tags
set tags=./tags;

" Supertab
" Let omnifunc and completefunc take precendence
set complete-=i
set completeopt=menu,menuone,longest " no scratch
set iskeyword+=- " do not use - as a word separator
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']

" vim-ruby
let ruby_no_expensive=1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_rails = 1

" Remove whitespace on save
autocmd BufWritePre <buffer> :%s/\s\+$//e

" Theme
set background=dark
set synmaxcol=500 " not slow when highlight long line
set t_Co=256

" Status line
hi statusline ctermfg=10 ctermbg=18
set statusline=
""display a warning if &paste is set
set statusline+=%#error#%{&paste?'[paste]':''}%*
set statusline+=%*\ %<%F%* "full path
set statusline+=%*%=%5l%*  "current line
set statusline+=%*/%L%*    "total lines
set statusline+=%*%4v\ %*  "virtual column number
function! ActiveStatus()
  hi statusline ctermfg=10 ctermbg=18
endfunction
function! InactiveStatus()
  hi statusline ctermfg=5 ctermbg=0
endfunction
au WinEnter * call ActiveStatus()
au WinLeave * call InactiveStatus()

" % to bounce from do to end etc.
runtime! macros/matchit.vim

" Autoreload vimrc
autocmd! bufwritepost vimrc source %

"------------------------------------------------------------------------------
" KEYMAPS
"------------------------------------------------------------------------------

" <Leader>1: Toggle between paste mode
nnoremap <silent> <Leader>1 :set paste!<cr>

" Kill buffer
nnoremap K :bw<cr>

" Unfuck my screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" map Y to make it consistent with C and D
nnoremap Y y$

" Maps arrow key resize
nnoremap <left> <C-w>5>
nnoremap <up> <C-w>5-
nnoremap <down> <C-w>5+
nnoremap <right> <C-w>5<

" Disable arrow keys when in insert-mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Quickfix
nmap <leader>c :copen<cr>
nmap <leader>e :Errors<cr>
nmap <leader>C :cclose<cr>
nmap <leader>cn :cnext<CR>
nmap <leader>cp :cprevious<CR>

" Navigate
nmap <leader>av :AV<CR>
nmap <leader>aa :A<CR>

" Nerdtree
let NERDTreeMinimalUI=1
let NERDTREEWinSize=30
nmap <silent><leader>nt :NERDTreeToggle<CR>
nmap <silent><leader>nf :NERDTreeFind<CR>

" Fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>dg :diffget<CR>

" reselect the text that was the pasted
nnoremap <leader>v V`]
nnoremap <silent> <leader>W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" CTags
map <C-\> :tnext<CR>

" Ack
map <leader>f :Ag! -i<space>

" NERDCommenter
map <leader>/ <plug>NERDCommenterToggle<CR>

" Insert hashrocket
imap <C-L> <Space>=><Space>

" CtrlP
noremap <leader>m :CtrlPCurWD<CR>
let g:ctrlp_map = "<leader><leader>"

" Rebuilt tags
map <leader>asd :!ctags -R --languages=ruby,javascript<CR>

"remove highlight when press enter
nnoremap <CR> :noh<CR><CR>

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

" Goimport
let g:go_fmt_command = "goimports"

" Ctrlp Settings
let g:ctrlp_max_height = 20

" Supertab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]

" Cfmt
let g:cfmt_style = '-linux'

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"------------------------------------------------------------------------------
" FILETYPES
"------------------------------------------------------------------------------

au BufNewFile,BufRead *.txt setfiletype text
au BufNewFile,BufRead *.txt setfiletype text
au BufNewFile,BufRead *.json set syntax=javascript ft=javascript
au BufNewFile,BufRead *.hbs set syntax=mustache
au BufNewFile,BufRead *.pde set filetype=c syntax=c cindent
au BufNewFile,BufRead *.html set textwidth=999
au BufNewFile,BufRead {Dockerfile} setlocal wrap linebreak nolist textwidth=78 syntax=off
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
autocmd BufWritePre *.c,*.h Cfmt
au FileType text setlocal textwidth=78

" Enable omni completion.
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
au FileType ruby setlocal omnifunc=rubycomplete#Complete
au FileType yaml setlocal syntax=off

" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
" hacks from above (the url, not jesus) to delete fugitive buffers when we
" leave them - otherwise the buffer list gets poluted
" add a mapping on .. to view parent tree
au BufReadPost fugitive://* set bufhidden=delete
au BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
