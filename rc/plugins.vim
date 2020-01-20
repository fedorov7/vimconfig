" autocompletion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'rhysd/vim-clang-format',{'for': ['c', 'cpp']}
Plug 'tenfyzhong/CompleteParameter.vim'
" edit
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' "repeat enhance
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim',{'on': 'Goyo'}
" helpers
Plug 'fidian/hexmode'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'dyng/ctrlsf.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'tpope/vim-sensible'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'voldikss/vim-translate-me'
Plug 'liuchengxu/vim-which-key'
Plug 'easymotion/vim-easymotion', { 'on': [ '<Plug>(easymotion-lineforward)',
            \ '<Plug>(easymotion-linebackward)','<Plug>(easymotion-overwin-w)' ]}
Plug 'neomake/neomake'
Plug 'tracyone/neomake-multiprocess'
" git
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
" coding
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-abolish'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'fedorov7/vim-uefi'
Plug 'fedorov7/ksslint',{'for': 'c'}
Plug 'fatih/vim-go',{'do': ':GoUpdateBinaries', 'for': 'go' }
Plug 'nsf/gocode',{'for': 'go', 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh'}
Plug 'vivien/vim-linux-coding-style',{'for': ['c', 'cpp']}
Plug 'bfrg/vim-cpp-modern',{'for': ['c', 'cpp']}
Plug 'mhinz/vim-lookup', {'for': 'vim'}
Plug 'chrisbra/vim-zsh',{'for': 'zsh'}
Plug 'tracyone/vim-zsh-completion',{'for': ['zsh','sh']}
" colors
Plug 'lilydjwg/colorizer'
Plug 'luochen1990/rainbow'
Plug 'nanotech/jellybeans.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'kergoth/vim-bitbake',{'for': 'bitbake'}
Plug 'pearofducks/ansible-vim',{'for': 'ansible'}
Plug 'pboettch/vim-cmake-syntax',{'for': 'cmake'}
" markdown
Plug 'iamcco/markdown-preview.vim',{'for': 'markdown'}
Plug 'iamcco/mathjax-support-for-mkdp',{'for': 'markdown'}
Plug 'mzlogin/vim-markdown-toc',{'for': 'markdown'}
Plug 'plasticboy/vim-markdown',{'for': 'markdown'}
