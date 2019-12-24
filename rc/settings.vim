" Various settings
set encoding=utf8
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
