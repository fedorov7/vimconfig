" Various settings
set encoding=utf8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb1830,big5,euc-jp,euc-kr,gbk

scriptencoding utf-8

set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
set hlsearch                    " highlight the last used search pattern
set incsearch                   " do incremental searching
set showcmd                     " display incomplete commands
set showmode                    " Show current mode down the bottom
set nojoinspaces                " prevents inserting two spaces after punctuation on a join
set lazyredraw                  " will not redraw the screen while running macros (goes faster)
set virtualedit=block           " let cursor move past the last char in <C-V> mode
set nostartofline               " avoid moving cursor to BOL when jumping around
set hidden
set wrap                      	" Don't wrap lines
set linebreak                   " Wrap lines at convenient points
set modeline

" Folds
set foldmethod=marker           " fold based on marker
set foldnestmax=3               " deepest fold is 3 levels
set nofoldenable                " dont fold by default

" Indentation
set autoindent                  " copy indent from current line
set smartindent                 " smart autoindenting when starting a new line
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=8
set expandtab                   " tabs are replaced with spacing

" Turn Off Swap Files
set noswapfile
set nobackup
set nowritebackup

set clipboard=unnamedplus

"do not Ring the bell (beep or screen flash) for error messages
set noerrorbells
if te#env#IsVim8()
set belloff=all
endif

" Display tabs and trailing spaces visually
if has('X11') || has('nvim')
  set list listchars=tab:\ \ ,trail:· " strings to use in 'list' mode
  set fillchars=vert:\│
  let g:NERDTreeDirArrows=1
else
  set list listchars=tab:\ \ ,trail:. " strings to use in 'list' mode
  set fillchars=vert:\|
  let g:NERDTreeDirArrows=0
endif

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:clang_format#detect_style_file=1

let g:rainbow_active = 1

let g:CtrlSpaceDefaultMappingKey = '<C-space> '
let g:vtm_target_lang = 'ru'

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

let g:linuxsty_patterns = [ '/usr/src/', '/linux' ]

let g:DoxygenToolkit_authorName='Alexander Fedorov'

" Tagbar {{{
let g:tagbar_left=0
let g:tagbar_width=30
let g:tagbar_sort=0
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_systemenc='cp936'
let g:tagbar_iconchars = ['+', '-']
"}}}

" Airline {{{
let g:airline_extensions = ['tabline', 'tagbar', 'branch']
let g:airline#extensions#ale#enabled = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#hunks#enabled = 0

let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ycm#enabled = 0
let g:airline#extensions#ctrlp#show_adjacent_modes = 0
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#show_tab_type = 0

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 1

set noshowmode
" }}}

" Markdown ------------------------{{{
if  te#env#IsMac()
    let g:mkdp_path_to_chrome = 'open -a safari'
elseif te#env#IsWindows()
    let g:mkdp_path_to_chrome = 'C:\\Program Files (x86)\Google\Chrome\Application\chrome.exe'
else
    let g:mkdp_path_to_chrome = 'google-chrome'
endif
let g:vim_markdown_toc_autofit = 1
"}}}
