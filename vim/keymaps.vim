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

" reselect the text that was the pasted
nnoremap <leader>v V`]
nnoremap <silent> <leader>W :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" Navigate windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" leader-][ to increase/decrease indentation
vmap <leader>] >gv
vmap <leader>[ <gv

" YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" NERDTree
nnoremap <silent><leader>nf :NERDTreeFind<CR>

" CTags
map <C-\> :tnext<CR>

" Ack
map <leader>f :Ack!<space>

" NERDCommenter
map <leader>/ <plug>NERDCommenterToggle<CR>

" Insert hashrocket
let g:EasyMotion_leader_key = '<Leader>m'

" Tabular
if exists(":Tabularize")
  noremap :T= :Tabularize /=
  noremap :T> :Tabularize /=>
  noremap :T: :Tabularize /:
  noremap :T{ :Tabularize /{
  noremap :T :Tabularize /}}
endif

" Rails
noremap <leader>a :A<CR>
noremap <leader>av :AV<CR>
noremap <leader>re :R<CR>
noremap <leader>rv :RV<CR>
noremap <leader>rm :Rmodel
noremap <leader>rc :Rcontroller

" Insert hashrocket
imap <C-L> <Space>=><Space>

" CtrlP
map <leader>t :CtrlP<CR>
map <leader>tc :CtrlP app/controllers<CR>
map <leader>tm :CtrlP app/models<CR>
map <leader>tv :CtrlP app/views<CR>
map <leader>tp :CtrlP app/presenters<CR>
map <leader>th :CtrlP app/helpers<CR>
map <leader>ta :CtrlP app/assets<CR>
