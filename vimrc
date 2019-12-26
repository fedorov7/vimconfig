set nocompatible
let $MYVIMRC=fnamemodify(expand('<sfile>'), ':p')
let $VIMFILES=fnamemodify(expand('<sfile>'), ':p:h')
set runtimepath^=$VIMFILES
set runtimepath+=$VIMFILES/after

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

silent! call plug#begin($VIMDIRPATH)

" Plugins in external file depending upon configuration
call te#feat#source_rc('plugins.vim')

" Initialize plugin system
silent! call plug#end()

colors jellybeans

call te#feat#source_rc('autocmd.vim')
call te#feat#source_rc('settings.vim')
call te#feat#source_rc('mappings.vim')
call te#feat#source_rc('complete.vim')
call te#feat#source_rc('jumping.vim')


filetype plugin indent on
syntax on
