"avoid source twice
if exists('b:did_ftplugin_loaded')
    finish
endif
let b:did_ftplugin_loaded = 1

setlocal colorcolumn=
nnoremap  <silent><buffer> q :bdelete<cr>
nnoremap  <silent><buffer> <tab> :call search('\|.\{-}\|', 'w')<cr>:noh<cr>2l
nnoremap  <silent><buffer> <S-tab> F\|:call search('\|.\{-}\|', 'wb')<cr>:noh<cr>2l
nnoremap  <silent><buffer> <cr> <c-]>
nnoremap  <silent><buffer> <bs> <c-T>

function! s:help_tag(prev) abort
  call search('|\S\+|', a:prev.'W')
endfunction

nnoremap <silent> <plug>(help-next-tag)
      \ :call <sid>help_tag('')<cr>
nnoremap <silent> <plug>(help-prev-tag)
      \ :call <sid>help_tag('b')<cr>

nmap  <silent><buffer> <C-j> <Plug>(help-next-tag)
nmap  <silent><buffer> <C-k> <Plug>(help-prev-tag)

nnoremap  <silent><buffer> d <c-d>
nnoremap  <silent><buffer> u <c-u>
