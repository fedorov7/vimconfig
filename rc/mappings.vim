nmap <F2> :map<CR>
" Bind F5 to fixing problems with ALE
nmap <F4> <Plug>(ale_lint)
nmap <F5> <Plug>(ale_fix)
nmap <F7> <Plug>(ale_detail)
nnoremap <silent><F12> :NERDTreeToggle .<CR>
nnoremap <silent><F9> :TagbarToggle<CR>

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
noremap <C-P> "+gP
vnoremap <C-X> "+x
vnoremap <C-C> "+y

" NERDCommenter toggle comment
nmap <Leader>cc <plug>NERDCommenterComment

" toggle free writing in vim (Goyo)
nnoremap <Leader>to :Goyo<cr>

"visual mode hit tab forward indent ,hit shift-tab backward indent
vnoremap <TAB>  >gv
vnoremap <s-TAB>  <gv

"switch previous tab or buftab
nnoremap <silent> <A-Left> :call te#utils#tab_buf_switch(0)<cr>

"switch next tab or buftab
nnoremap <silent> <A-Right> :call te#utils#tab_buf_switch(-1)<cr>

"generate tags and cscope
nnoremap <LocalLeader>u :call te#pg#gen_cs_out()<cr>

"checkhealth
nnoremap <silent> <Leader>ch :call te#utils#check_health()<cr>

" toggle background option.
nnoremap  <silent><leader>tb :call te#utils#OptionToggle("bg",["dark","light"])<cr>

" substitution improvements
if te#env#IsNvim()
    nnoremap <c-h> :%s/<C-R>=expand("<cword>")<cr>/
    vnoremap <c-h> :<c-u>%s/<C-R>=getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]<cr>/
    nnoremap ss :%s//<left>
    xnoremap ss :s//<left>
endif

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

" Easymotion {{{
map W <Plug>(easymotion-lineforward)
map B <Plug>(easymotion-linebackward)
" MultiWindow easymotion for word
nmap <Leader>jw <Plug>(easymotion-overwin-w)
xmap <Leader>jw <Plug>(easymotion-bd-w)
omap <Leader>jw <Plug>(easymotion-bd-w)
" Multi Input Find Motion:s
nmap <Leader>js <Plug>(easymotion-sn)
xmap <Leader>js <Plug>(easymotion-sn)
omap <Leader>js <Plug>(easymotion-sn)
" Multi Input Find Motion:t
nmap <Leader>jt <Plug>(easymotion-tn)
xmap <Leader>jt <Plug>(easymotion-tn)
omap <Leader>jt <Plug>(easymotion-tn)
" MultiWindow easymotion for line
nmap <Leader>jl <Plug>(easymotion-overwin-line)
xmap <Leader>jl <Plug>(easymotion-bd-jk)
omap <Leader>jl <Plug>(easymotion-bd-jk)
" MultiWindow easymotion for char
nmap <Leader>jj <Plug>(easymotion-overwin-f)
xmap <Leader>jj <Plug>(easymotion-bd-f)
omap <Leader>jj <Plug>(easymotion-bd-f)
" }}}
