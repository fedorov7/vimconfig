set nocompatible

let $MYVIMRC=fnamemodify(expand('<sfile>'), ':p')
let $VIMFILES=fnamemodify(expand('<sfile>'), ':p:h')
set runtimepath^=$VIMFILES
set runtimepath+=$VIMFILES/after

let $VIMCONFIG=$VIMFILES.'/rc/'

let $VIMDIRPATH=$VIMFILES.'/plugged/'
if !isdirectory($VIMDIRPATH)
    silent! call mkdir($VIMDIRPATH, 'p')
endif

silent! call plug#begin($VIMDIRPATH.'/plugged')

" Plugins in external file depending upon configuration
source $VIMCONFIG/plugins.vim

" Initialize plugin system
silent! call plug#end()

syntax on
colors jellybeans

source $VIMCONFIG/settings.vim

let mapleader=','
let g:airline_powerline_fonts = 1
let g:UltiSnipsExpandTrigger = '<tab>'
let g:clang_format#detect_style_file=1
let g:rbpt_colorpairs = [
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkred',     'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'firebrick3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['brown',       'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

nmap <F2> :map<CR>

let g:CtrlSpaceDefaultMappingKey = '<C-space> '

augroup vtm_bindings
let g:vtm_target_lang = 'ru'
" Echo translation in the cmdline
nmap <silent> <Leader>tt <Plug>Translate
vmap <silent> <Leader>tt <Plug>TranslateV
" Display translation in the popup window
nmap <silent> <Leader>tw <Plug>TranslateW
vmap <silent> <Leader>tw <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>tr <Plug>TranslateR
vmap <silent> <Leader>tr <Plug>TranslateRV
augroup END

augroup c_bindings
  au FileType c nmap <Leader>a :LinuxCodingStyle<CR>
augroup END

" Ycm bindings
augroup ale_bindings
  " Bind F5 to fixing problems with ALE
  nmap <F4> <Plug>(ale_lint)
  nmap <F5> <Plug>(ale_fix)
  nmap <F7> <Plug>(ale_detail)
  nmap <silent> <C-k> <Plug>(ale_previous_wrap)
  nmap <silent> <C-j> <Plug>(ale_next_wrap)
augroup END

let g:ale_python_pylint_options = '--include-naming-hint=y --const-naming-style=any --attr-naming-style=any --variable-naming-style=any --disable=missing-docstring'
let g:ale_python_auto_pipenv = 1

let g:ale_linters = {
\   'c': ['clangtidy'],
\   'cpp': ['clangtidy'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'markdown' : ['prettier'],
\   'sh': ['shfmt'],
\   'cmake' : ['cmakeformat'],
\   'c': ['iwyu'],
\   'cpp': ['iwyu'],
\   'python' : ['autopep8', 'isort', 'yapf', 'black'],
\}

let g:airline#extensions#ale#enabled = 1

let g:linuxsty_patterns = [ '/usr/src/', '/linux' ]

" vim-go plugin options
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:DoxygenToolkit_authorName='Alexander Fedorov'

augroup complete_parameter
  inoremap <silent><expr> ( complete_parameter#pre_complete("()")
  smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
  imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
  smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
  imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)

  let g:complete_parameter_use_ultisnips_mapping = 1
augroup END

augroup go_improvemnets
  " vim-go mappings
  au FileType go nmap <Leader>r <Plug>(go-run)
  au FileType go nmap <Leader>b <Plug>(go-build)
  au FileType go nmap <Leader>t <Plug>(go-test)
  au FileType go nmap <Leader>c <Plug>(go-coverage)

  au FileType go nmap <Leader>ds <Plug>(go-def-split)
  au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
  au FileType go nmap <Leader>dt <Plug>(go-def-tab)

  au FileType go nmap <Leader>gd <Plug>(go-doc)
  au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

  au FileType go nmap <Leader>s <Plug>(go-implements)
  au FileType go nmap <Leader>i <Plug>(go-info)
  au FileType go nmap <Leader>e <Plug>(go-rename)

  " Only trailing spaces visually for go
  autocmd FileType go set nolist
augroup END

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

augroup python_improvements
  autocmd BufNewFile,BufRead *.py set ft=python
  autocmd FileType python set tabstop=4|set softtabstop=4|set shiftwidth=4|set textwidth=79|set expandtab|set fileformat=unix
augroup END

augroup rainbow_parentheses
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces
augroup END

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

let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_confirm_extra_conf=0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_key_invoke_completion =  '<S-TAB>'
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_use_ultisnips_completer = 1

" Ycm bindings
augroup ycm_bindings
  au FileType c,cpp,python nnoremap <Leader>d :YcmCompleter GoToDeclaration<CR>
  au FileType c,cpp,python nnoremap <Leader>f :YcmCompleter GoToDefinition<CR>
  au FileType c,cpp,python nnoremap <Leader>g :YcmCompleter GoTo<CR>
  au FileType c,cpp,python nnoremap <Leader>h :YcmCompleter GetDoc<CR>
  au FileType c,cpp,python nnoremap <Leader>t :YcmCompleter GetType<CR>
  au FileType python       nnoremap <Leader>r :YcmCompleter GoToReferences<CR>
  au FileType c,cpp        nnoremap <Leader>i :YcmCompleter GoToImprecise<CR>
  au FileType c,cpp        nnoremap <Leader>p :YcmCompleter GetParent<CR>
  au FileType c,cpp        nnoremap <Leader>c :YcmCompleter ClearCompilationFlagCache<CR>
  au FileType c,cpp nnoremap <F3> :YcmCompleter FixIt<CR>
  au FileType c,cpp nnoremap <F8> :YcmShowDetailedDiagnostic<CR>
  au FileType c,cpp nnoremap <F9> :YcmDiags<CR>
augroup END

"-------------------------------------------------------------------------------
" CScope
" ------------------------------------------------------------------------------
"
if has('cscope')
        " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
        set cscopetag

        " check cscope for definition of a symbol before checking ctags: set to 1
        " if you want the reverse search order.
        "set csto=1

        " show msg when any other cscope db added
        set nocscopeverbose

        " add any cscope database in current directory
        if filereadable('cscope.out')
                cs add cscope.out
                " else add the database pointed to by environment variable
        elseif $CSCOPE_DB !=# ''
                cs add $CSCOPE_DB
        endif

        """"""""""""" My cscope/vim key mappings
        "
        " The following maps all invoke one of the following cscope search types:
        "
        "   's'   symbol: find all references to the token under cursor
        "   'g'   global: find global definition(s) of the token under cursor
        "   'c'   calls:  find all calls to the function name under cursor
        "   't'   text:   find all instances of the text under cursor
        "   'e'   egrep:  egrep search for the word under cursor
        "   'f'   file:   open the filename under cursor
        "   'i'   includes: find files that include the filename under cursor
        "   'd'   called: find functions that function under cursor calls
        "
        " Below are three sets of the maps: one set that just jumps to your
        " search result, one that splits the existing vim window horizontally and
        " diplays your search result in the new window, and one that does the same
        " thing, but does a vertical split instead (vim 6 only).
        "
        " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
        " unlikely that you need their default mappings (CTRL-\'s default use is
        " as part of CTRL-\ CTRL-N typemap, which basically just does the same
        " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
        " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
        " of these maps to use other keys.  One likely candidate is 'CTRL-_'
        " (which also maps to CTRL-/, which is easier to type).  By default it is
        " used to switch between Hebrew and English keyboard mode.
        "
        " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
        " that searches over '#include <time.h>" return only references to
        " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
        " files that contain 'time.h' as part of their name).


        " To do the first type of search, hit 'CTRL-\', followed by one of the
        " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
        " search will be displayed in the current window.  You can use CTRL-T to
        " go back to where you were before the search.
        "

        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


        " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
        " makes the vim window split horizontally, with search result displayed in
        " the new window.
        "
        " (Note: earlier versions of vim may not have the :scs command, but it
        " can be simulated roughly via:
        "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

        nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


        " Hitting CTRL-space *twice* before the search type does a vertical
        " split instead of a horizontal one (vim 6 and up only)
        "
        " (Note: you may wish to put a 'set splitright' in your .vimrc
        " if you prefer the new window on the right instead of the left

        nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
        nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
        nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
        nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


        """"""""""""" key map timeouts
        "
        " By default Vim will only wait 1 second for each keystroke in a mapping.
        " You may find that too short with the above typemaps.  If so, you should
        " either turn off mapping timeouts via 'notimeout'.
        "
        "set notimeout
        "
        " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
        " with your own personal favorite value (in milliseconds):
        "
        "set timeoutlen=4000
        "
        " Either way, since mapping timeout settings by default also set the
        " timeouts for multicharacter 'keys codes' (like <F1>), you should also
        " set ttimeout and ttimeoutlen: otherwise, you will experience strange
        " delays as vim waits for a keystroke after you hit ESC (it will be
        " waiting to see if the ESC is actually part of a key code like <F1>).
        "
        "set ttimeout
        "
        " personally, I find a tenth of a second to work well for key code
        " timeouts. If you experience problems and have a slow terminal or network
        " connection, set it higher.  If you don't set ttimeoutlen, the value for
        " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
        "
        "set ttimeoutlen=100

endif
