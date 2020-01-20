"avoid source twice
if exists('b:did_ftplugin_loaded')
  finish
endif
let b:did_ftplugin_loaded = 1

setlocal colorcolumn=100

nnoremap <silent><buffer><Leader>cf :<C-u>ClangFormat<CR>
vnoremap <silent><buffer><Leader>cf :ClangFormat<CR>

:match Error /\s\+$/

let b:ale_linters = ['clangtidy']
