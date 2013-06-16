" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set encoding=utf-8
"------------------------------------------------------------------------------
" BUNDLES
"------------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'thisivan/vim-bufexplorer'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'godlygeek/tabular'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/matchit.zip'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/bufkill.vim'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-endwise'
Bundle 'Valloric/YouCompleteMe'
Bundle 'benmills/vimux'
Bundle "ecomba/vim-ruby-refactoring"
Bundle 'kien/ctrlp.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/unite.vim'
Bundle 'scrooloose/syntastic'
Bundle 'nsf/gocode', {'rtp': 'vim/'}
Bundle 'vim-scripts/VimClojure'
Bundle 'jnwhiteh/vim-golang'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'kchmck/vim-coffee-script'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'groenewege/vim-less'
Bundle 'nono/vim-handlebars'
Bundle 'pangloss/vim-javascript'
Bundle 'klen/python-mode'
Bundle 'nanotech/jellybeans.vim'
filetype plugin on
filetype plugin indent on
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
autocmd BufWritePre <buffer> :%s/\s\+$//e

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

let g:syntastic_javascript_checkers=['jshint']

" Theme
let g:Powerline_symbols = 'fancy'
set ttyfast
set background=dark
set lazyredraw
set synmaxcol=160 " not slow when highlight long line
colorscheme jellybeans

" % to bounce from do to end etc.
runtime! macros/matchit.vim

"------------------------------------------------------------------------------
" FILETYPES
"------------------------------------------------------------------------------

au BufNewFile,BufRead *.txt setfiletype text
au BufNewFile,BufRead *.json set syntax=javascript ft=javascript
au BufNewFile,BufRead *.hbs set syntax=mustache
au BufNewFile,BufRead *.pde set filetype=c syntax=c cindent
au BufNewFile,BufRead *.html set textwidth=999
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufEnter *.hs compiler ghc

autocmd FileType text setlocal textwidth=78

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

"------------------------------------------------------------------------------
" FUNCTIONS
"------------------------------------------------------------------------------
function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_spec.js.coffee\|_spec.coffee\)$') != -1
  if in_test_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  if match(a:filename, '\.feature$') != -1
    return RunVimTmuxCommand("script/features " . a:filename)
  elseif match(a:filename, '\(_spec.js.coffee\|_spec.coffee\)$') != -1
    return RunVimTmuxCommand("./node_modules/.bin/mocha " . a:filename)
  else
    if filereadable("script/test")
      return RunVimTmuxCommand("script/test " . a:filename)
    elseif filereadable("Gemfile")
      " We assume rspec here
      return RunVimTmuxCommand("rspec --color " . a:filename)
    end
  end
endfunction

"------------------------------------------------------------------------------
" KEYMAPS
"------------------------------------------------------------------------------
map <leader>l :call RunTestFile()<CR>
map <leader>L :call RunNearestTest()<CR>

" <Leader>1: Toggle between paste mode
nnoremap <silent> <Leader>1 :set paste!<cr>

" Edit routes
command! Rroutes :e config/routes.rb
command! Rschema :e db/schema.rb

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" map Y to make it consistent with C and D
nnoremap Y y$

" Maps arrow key to resizing a window split
nnoremap <left> <C-w>5>
nnoremap <up> <C-w>5-
nnoremap <down> <C-w>5+
nnoremap <right> <C-w>5<

" Disable arrow keys when in insert-mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Navigate
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>
map <F1> :bnext<CR>
map <F2> :bprevious<CR>
map <F3> :cclose<CR>

" Fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>dp :diffput<CR>
nnoremap <leader>dg :diffget<CR>

" reselect the text that was the pasted
nnoremap <leader>v V`]
nnoremap <silent> <leader>W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" YankRing
nnoremap <silent> <C-p> :YRShow<cr>
inoremap <silent> <C-p> <ESC>:YRShow<cr>

" NERDTree
nnoremap <silent><leader>nf :NERDTreeFind<CR>
nnoremap <silent><leader>nt :NERDTreeToggle<CR>

" OS-X like space for scroll
nnoremap <Space> <C-F>

" Backspace closes buffer.
nnoremap <BS> :BD<CR>
nnoremap <S-BS> :bd<CR>

" CTags
map <C-\> :tnext<CR>

" Ack
map <leader>f :Ack!<space>

" NERDCommenter
map <leader>/ <plug>NERDCommenterToggle<CR>

" Tabular
if exists(":Tabularize")
  noremap <leader>t= :Tabularize /=
  noremap <leader>t> :Tabularize /=>
  noremap <leader>t: :Tabularize /:\zs
  noremap <leader>ts :Tabularize /:/l1c0l0
  noremap <leader>t{ :Tabularize /{
endif

" Rails
noremap <leader>a :A<CR>
noremap <leader>av :AV<CR>
noremap <leader>re :R<CR>
noremap <leader>rv :RV<CR>
noremap <leader>rm :Rmodel
noremap <leader>rc :Rcontroller

"Switch
nnoremap - :Switch<cr>

" Insert hashrocket
imap <C-L> <Space>=><Space>

" CtrlP
noremap <leader>m :CtrlPCurWD<CR>
let g:ctrlp_map = "<leader><leader>"

" Rebuilt tags
map <leader>asd :!ctags -R --languages=ruby,javascript<CR>

" Vimux
nnoremap <leader>qp :VimuxPromptCommand<Cr>
nnoremap <leader>qr :VimuxRunLastCommand<Cr>

"remove highlight when press enter
nnoremap <CR> :noh<CR><CR>

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
