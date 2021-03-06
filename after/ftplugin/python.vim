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

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'isort', 'yapf', 'black']

let b:ale_python_pylint_options = '--include-naming-hint=y --const-naming-style=any --attr-naming-style=any --variable-naming-style=any --disable=missing-docstring'
let b:ale_python_auto_pipenv = 1

nnoremap  <silent><buffer> <LocalLeader>c :call te#complete#lookup_reference()<cr>

"sudo pip3 install yapf
if te#env#Executable('yapf')
    nnoremap  <silent><buffer><leader>cf :0,$!yapf<CR>
    vnoremap  <silent><buffer><leader>cf :!yapf<CR>
elseif te#env#Executable('autopep8')
    nnoremap  <silent><buffer><leader>cf :%!autopep8 -<CR>
    vnoremap  <silent><buffer><leader>cf :!autopep8 -<CR>
else
    nnoremap  <silent><buffer><leader>cf :call te#utils#EchoWarning("Please install yapf or autopep8")<cr>
    vnoremap  <silent><buffer><leader>cf :call te#utils#EchoWarning("Please install yapf or autopep8")<cr>
endif
