"avoid source twice
if exists('b:did_ftplugin_loaded')
    finish
endif
let b:did_ftplugin_loaded = 1

"settings
setlocal foldmethod=marker
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal smarttab
setlocal suffixesadd=.vim
setlocal iskeyword+=:,#

setlocal omnifunc=te#complete#vim_complete

"keymapping
nnoremap <silent><buffer> <c-]>  :call lookup#lookup()<cr>
nnoremap <silent><buffer> <c-t>  :call lookup#pop()<cr>
nnoremap <silent><buffer> <Leader>vd :call te#tools#vim_get_message()<cr>
nnoremap <silent><buffer> <Leader>sm :message<cr>
