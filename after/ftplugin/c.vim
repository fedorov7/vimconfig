"avoid source twice
if exists('b:did_ftplugin_loaded')
  finish
endif
let b:did_ftplugin_loaded = 1

setlocal cinoptions=:0,l1,t0,g0,(0)
setlocal comments    =sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/
setlocal cindent  "enable specific indenting for C code
setlocal foldmethod=syntax

nnoremap <silent><buffer><Leader>a :LinuxCodingStyle<CR>
nnoremap <silent><buffer><Leader>cf :<C-u>ClangFormat<CR>
vnoremap <silent><buffer><Leader>cf :ClangFormat<CR>

if &filetype ==# 'cpp'
    execute 'source '.$VIMFILES.'/after/ftplugin/cpp.vim'
else
setlocal colorcolumn=80
endif

:match Error /\s\+$/

let b:ale_linters = ['clangtidy', 'cpplint']
let b:ale_c_clangtidy_checks = ['*', '-fuchsia-*', '-llvm*', '-modernize-use-trailing-return-type', '-altera-*', '-cppcoreguidelines-avoid-magic-numbers', '-readability-magic-numbers' ]

let b:ale_fixers = ['clangtidy']
let b:ale_cpp_clangtidy_checks = ['*', '-fuchsia-*', '-llvm*', '-modernize-use-trailing-return-type', '-altera-*', '-cppcoreguidelines-avoid-magic-numbers', '-readability-magic-numbers' ]
