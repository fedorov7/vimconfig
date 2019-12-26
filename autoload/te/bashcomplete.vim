let s:self = {}

let s:completer = $VIMFILES . '/bin/get_complete '

" this is for vim command completion 

function! s:self.complete(ArgLead, CmdLine, CursorPos) abort
    if a:CmdLine =~# '^\s\{0,\}\w\+$'
        let l:result = te#compatiable#systemlist('compgen -c ' . a:CmdLine)
        if type(l:result) == g:t_number
            return [] 
        endif
        return l:result
    endif
    let l:result = te#compatiable#systemlist(s:completer.a:CmdLine)
    if type(l:result) == g:t_number
        return [] 
    endif
    return map(l:result, 'substitute(v:val, "[ ]*$", "", "g")')
endfunction


" this is for vim input()

function! s:self.complete_input(ArgLead, CmdLine, CursorPos) abort
    if a:CmdLine =~# '^\s\{0,\}\w\+$'
        let l:result = te#compatiable#systemlist('compgen -c ' . a:CmdLine)
        if type(l:result) == g:t_number
            return [] 
        endif
        return l:result
    endif
    let l:result = te#compatiable#systemlist(s:completer.a:CmdLine)
    if type(l:result) == g:t_number
        return [] 
    endif
    if a:ArgLead ==# ''
        let l:result = map(l:result, 'a:CmdLine . v:val')
    else
        let leader = substitute(a:CmdLine, '[^ ]*$', '', 'g')
        let l:result = map(l:result, 'leader . v:val')
    endif
    return l:result
endfunction

function! te#bashcomplete#cmd_complete(ArgLead, CmdLine, CursorPos) abort
    setlocal shell=bash
    return s:self.complete_input(a:ArgLead, a:CmdLine, a:CursorPos)
endfunction

let s:pos = 0

let s:str = ''

let s:base = ''


function! te#bashcomplete#omnicomplete(findstart, base) abort
    if a:findstart
        let str = getline('.')[:col('.') - 2]
        let s:str = substitute(str, '[^ ]*$', '' , 'g')
        let s:pos = len(s:str)
        let s:base = str[s:pos :]
        return s:pos
    else
        return s:self.complete(a:base, s:str . s:base, col('.'))
    endif
endfunction
