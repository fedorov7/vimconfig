let g:complete_plugin={}
let g:complete_plugin.name=['YouCompleteMe']

" lazyload ultisnips and YouCompleteMe
" jume to definition (YCM)
function! s:enable_ycm()
    call youcompleteme#Enable()
endfunction
let g:complete_plugin.enable_func=function('<SID>enable_ycm')

"inoremap <silent><expr> ( complete_parameter#pre_complete("()")
"smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
"imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

"let g:complete_parameter_use_ultisnips_mapping = 1

"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_filepath_completion_use_working_dir = 1
"let g:ycm_key_invoke_completion =  '<S-TAB>'
"let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_use_ultisnips_completer = 1

let g:ycm_warning_symbol = '!'
let g:ycm_error_symbol = '>>'
let g:ycm_key_detailed_diagnostics = '<leader>ys'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf=0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_semantic_triggers = {
            \ 'c' : ['->', '    ', '.', ' ', '(', '[', '&', 're!\w{4}'],
            \ 'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
            \ 'perl' : ['->', '::', ' '],
            \ 'php' : ['->', '::', '.'],
            \ 'cs,java,javascript,d,vim,perl6,scala,vb,elixir,go' : ['.'],
            \ 'ruby' : ['.', '::'],
            \ 'lua' : ['.', ':'],
            \ 'vim' : ['$', '&', 're![\w&$<-][\w:#<>-]*']
            \ }
let g:ycm_semantic_triggers.tex = [
			\ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
			\ ]
let g:ycm_semantic_triggers.php = ['->', '::', '(', 'use ', 'namespace ', '\', '$', 're!\w{3}']
let g:ycm_semantic_triggers.html = ['<', '"', '</', ' ']
let g:ycm_semantic_triggers.python=['.', 'import ', 're!import [,\w ]+, ']
let g:ycm_semantic_triggers.vimshell=['re!\w{2}', '/']
let g:ycm_semantic_triggers.sh=['re![\w-]{2}', '/', '-', '$']
let g:ycm_semantic_triggers.zsh=['re![\w-]{2}', '/', '-', '$']

let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'startufy' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \}
let g:ycm_global_ycm_extra_conf = $VIMFILES.'/rc/ycm_conf_for_c.py'

" Ycm bindings
nnoremap  <silent><leader>yd :YcmDiags<CR>
nnoremap  <silent><leader>yf :YcmCompleter FixIt<CR>
nnoremap  <silent><leader>yj :YcmCompleter GoTo<CR>
nnoremap  <silent><leader>yh :YcmCompleter GetDoc<CR>
nnoremap  <silent><leader>yt :YcmCompleter GetType<CR>
nnoremap  <silent><leader>yp :YcmCompleter GetParent<CR>
nnoremap  <silent><leader>yr :YcmCompleter GoToReferences<CR>
nnoremap  <silent><leader>yi :YcmCompleter GoToImprecise<CR>
nnoremap  <silent><leader>yl :YcmCompleter GoToDeclaration<CR>
nnoremap  <silent><leader>yn :YcmCompleter GoToDefinition<CR>
nnoremap  <silent><leader>yc :YcmCompleter ClearCompilationFlagCache<CR>

" UltiSnips -----------------------{{{
if  te#env#SupportPy2()
    let g:UltiSnipsUsePythonVersion = 2
else
    let g:UltiSnipsUsePythonVersion = 3
endif
"let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsListSnippets ='<c-tab>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
"let g:UltiSnipsSnippetDirectories=['bundle/snippets/ultisnips']
"let g:UltiSnipsSnippetsDir=g:vinux_plugin_dir.cur_val.'/snippets/ultisnips'
call extend(g:complete_plugin.name, ['ultisnips', 'snippets'])
"}}}

call te#feat#register_vim_plug_insert_setting([g:complete_plugin.enable_func],
            \ g:complete_plugin.name)
