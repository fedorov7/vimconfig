"avoid source twice
if exists('b:did_ftplugin') 
    finish
endif
let b:did_ftplugin = 1

nmap <Leader>a :LinuxCodingStyle<CR>
