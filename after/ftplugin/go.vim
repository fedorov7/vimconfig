"avoid source twice
if exists('b:did_ftplugin_loaded')
    finish
endif
let b:did_ftplugin_loaded = 1

" Only trailing spaces visually for go
setlocal nolist

" vim-go plugin options
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" vim-go mappings
nnoremap  <silent><buffer><Leader>r <Plug>(go-run)
nnoremap  <silent><buffer><Leader>b <Plug>(go-build)
nnoremap  <silent><buffer><Leader>t <Plug>(go-test)
nnoremap  <silent><buffer><Leader>c <Plug>(go-coverage)

nnoremap  <silent><buffer><Leader>ds <Plug>(go-def-split)
nnoremap  <silent><buffer><Leader>dv <Plug>(go-def-vertical)
nnoremap  <silent><buffer><Leader>dt <Plug>(go-def-tab)

nnoremap  <silent><buffer><Leader>gd <Plug>(go-doc)
nnoremap  <silent><buffer><Leader>gv <Plug>(go-doc-vertical)
nnoremap  <silent><buffer><Leader>gb <Plug>(go-doc-browser)

nnoremap  <silent><buffer><Leader>s <Plug>(go-implements)
nnoremap  <silent><buffer><Leader>i <Plug>(go-info)
nnoremap  <silent><buffer><Leader>e <Plug>(go-rename)

let b:ale_linters = ['gometalinter', 'gofmt']
