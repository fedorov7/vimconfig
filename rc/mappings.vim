nmap <F2> :map<CR>
" Bind F5 to fixing problems with ALE
nmap <F4> <Plug>(ale_lint)
nmap <F5> <Plug>(ale_fix)
nmap <F7> <Plug>(ale_detail)
noremap <F12> :NERDTreeToggle .<CR> 
nnoremap <silent><F9> :TagbarToggle<CR>
nnoremap  <silent><leader>tt :TagbarToggle<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Echo translation in the cmdline
nmap <silent> <Leader>tt <Plug>Translate
vmap <silent> <Leader>tt <Plug>TranslateV
" Display translation in the popup window
nmap <silent> <Leader>tw <Plug>TranslateW
vmap <silent> <Leader>tw <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>tr <Plug>TranslateR
vmap <silent> <Leader>tr <Plug>TranslateRV

" System clipboard support
vmap <C-c> "+y<CR>
nmap <C-p> "+p<CR>

"-------------------------------------------------------------------------------
" CtrlSF plugin key bindings
"-------------------------------------------------------------------------------
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

