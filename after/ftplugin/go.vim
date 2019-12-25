"avoid source twice
if exists('b:did_ftplugin') 
    finish
endif

let b:did_ftplugin = 1
" Only trailing spaces visually for go
set nolist

" vim-go plugin options
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-go mappings
nmap <Leader>r <Plug>(go-run)
nmap <Leader>b <Plug>(go-build)
nmap <Leader>t <Plug>(go-test)
nmap <Leader>c <Plug>(go-coverage)

nmap <Leader>ds <Plug>(go-def-split)
nmap <Leader>dv <Plug>(go-def-vertical)
nmap <Leader>dt <Plug>(go-def-tab)

nmap <Leader>gd <Plug>(go-doc)
nmap <Leader>gv <Plug>(go-doc-vertical)
nmap <Leader>gb <Plug>(go-doc-browser)

nmap <Leader>s <Plug>(go-implements)
nmap <Leader>i <Plug>(go-info)
nmap <Leader>e <Plug>(go-rename)
