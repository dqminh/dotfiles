set pastetoggle=<F3>

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
let g:ctrlp_map = "<leader><leader>"

" Rebuilt tags
map <leader>asd :!ctags -R --languages=ruby,javascript<CR>

" Vimux
nnoremap <leader>qp :VimuxPromptCommand<Cr>
nnoremap <leader>qr :VimuxRunLastCommand<Cr>
