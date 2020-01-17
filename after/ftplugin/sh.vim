"avoid source twice
if exists('b:did_ftplugin_loaded')
    finish
endif
let b:did_ftplugin_loaded = 1

"shell script
setlocal expandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal smarttab
setlocal foldmethod=indent

if  matchstr(&shell,'zsh') !=# ''
    setlocal omnifunc=zsh_completion#Complete
else
    setlocal shell=bash
    setlocal omnifunc=te#bashcomplete#omnicomplete
endif

nnoremap <buffer> <silent> K :call te#utils#find_mannel()<cr>
