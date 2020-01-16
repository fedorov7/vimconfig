set nocompatible
let $MYVIMRC=fnamemodify(expand('<sfile>'), ':p')
let $VIMFILES=fnamemodify(expand('<sfile>'), ':p:h')
set runtimepath^=$VIMFILES
set runtimepath+=$VIMFILES/after
if has('win64') || has('win32')
    set pythonthreedll=$HOME\\AppData\\Local\\Programs\\Python\\Python36\\python36.dll
    set pythondll=$HOME\\AppData\\Local\\Programs\\Python\\Python27\\python27.dll
    if !filereadable(&pythondll)
        set pythondll&
    endif
    if !filereadable(&pythonthreedll)
        set pythonthreedll&
    endif
    let $PATH = $VIMFILES.'/bin;'.$PATH
else
    "remove default folder from rtp
    if $VIMFILES !=# $HOME.'/.vim'
        set runtimepath-=$HOME/.vim
        set runtimepath-=$HOME/.vim/after
    endif
    let $PATH = $VIMFILES.'/bin:'.$PATH
endif

let &runtimepath=&runtimepath.','.$VIMFILES
if !filereadable($VIMFILES.'/autoload/plug.vim')
  if te#env#Executable('curl') && te#env#Executable('git')
    if te#env#IsWindows()
      silent! exec ':!mkdir -p '.$VIMFILES.'\\autoload'
      silent! exec ':!curl -fLo ' . $VIMFILES.'\\autoload'.'\\plug.vim ' .
            \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    else
      silent! exec ':!mkdir -p '.$VIMFILES.'/autoload'
      silent! exec ':!curl -fLo ' . $VIMFILES.'/autoload'.'/plug.vim ' .
            \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif
  else
    call te#utils#EchoWarning('Please install curl and git!', 1)
  endif
endif


let $VIMDIRPATH=$VIMFILES.'/plugged/'
if !isdirectory($VIMDIRPATH)
    silent! call mkdir($VIMDIRPATH, 'p')
endif

call te#feat#source_rc('autocmd.vim')

silent! call plug#begin($VIMDIRPATH)

call te#feat#register_vim_enter_setting(function('te#feat#check_plugin_install'))
call te#feat#register_vim_enter_setting(function('te#utils#echo_info_after'))

" Plugins in external file depending upon configuration
call te#feat#source_rc('plugins.vim')

" Initialize plugin system
silent! call plug#end()

colors jellybeans

call te#feat#source_rc('settings.vim')
call te#feat#source_rc('mappings.vim')
call te#feat#source_rc('complete.vim')
call te#feat#source_rc('jumping.vim')


filetype plugin indent on
syntax on
