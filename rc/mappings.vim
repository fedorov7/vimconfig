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
noremap <C-P> "+gP
vnoremap <C-X> "+x
vnoremap <C-C> "+y

" NERDCommenter toggle comment
nmap <Leader>cc <plug>NERDCommenterComment

" toggle free writing in vim (Goyo)
nnoremap <Leader>to :Goyo<cr>

" Markdown ------------------------{{{
" Markdown preview in browser
nnoremap <leader>mp :MarkdownPreview<cr>
" generate markdown TOC
nnoremap <leader>mt :silent GenTocGFM<cr>
" update markdown TOC
nnoremap <leader>mu :silent UpdateToc<cr>
" Show toc sidebar
nnoremap <leader>ms :Toc<cr>
"}}}

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
