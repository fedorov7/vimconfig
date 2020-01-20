"avoid source twice
if exists('b:did_ftplugin_loaded')
    finish
endif
let b:did_ftplugin_loaded = 1

runtime! ftplugin/html.vim ftplugin/html_*.vim ftplugin/html/*.vim
unlet! b:did_ftplugin
let b:undo_ftplugin = 'setl cms< com< fo<'
let b:did_ftplugin = 1
setlocal nospell
setlocal conceallevel=2
setlocal autoindent
setlocal textwidth=0
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal smarttab

" Markdown preview in browser
nnoremap <silent><buffer><leader>mp :MarkdownPreview<cr>
" generate markdown TOC
nnoremap <silent><buffer><leader>mt :silent GenTocGFM<cr>
" update markdown TOC
nnoremap <silent><buffer><leader>mu :silent UpdateToc<cr>
" Show toc sidebar
nnoremap <silent><buffer><leader>ms :Toc<cr>

let b:ale_fixers = ['prettier']
