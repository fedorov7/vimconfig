"avoid source twice
if exists('b:did_ftplugin_loaded')
    finish
endif
let b:did_ftplugin_loaded = 1

setlocal smarttab
setlocal tabstop=8
setlocal softtabstop=0
setlocal noexpandtab
setlocal shiftwidth=8
