set conceallevel=1
set concealcursor=inc
hi Conceal ctermfg=8 ctermbg=NONE guifg=Grey40 guibg=NONE
" for light background
" hi Conceal ctermfg=7 ctermbg=NONE guifg=Grey guibg=NONE

function! <SID>SetIndentLine()
  for i in range(&shiftwidth+1, 100, &shiftwidth)
    exe 'syn match IndentLine /\(^\s\+\)\@<=\%'.i.'v / containedin=ALL conceal cchar=|'
  endfor
endfunction

autocmd BufRead * call <SID>SetIndentLine()
