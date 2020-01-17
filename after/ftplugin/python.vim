"avoid source twice
if exists('b:did_ftplugin_loaded')
    finish
endif
let b:did_ftplugin_loaded = 1

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix
