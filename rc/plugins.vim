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
Plug 'adah1972/fencview',{'on': 'FencManualEncoding'}
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
Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
Plug 'justinmk/vim-syntax-extra',{'for': ['c', 'cpp', 'lex', 'yacc']}
" markdown
Plug 'iamcco/markdown-preview.vim',{'for': 'markdown'}
Plug 'iamcco/mathjax-support-for-mkdp',{'for': 'markdown'}
Plug 'mzlogin/vim-markdown-toc',{'for': 'markdown'}
Plug 'plasticboy/vim-markdown',{'for': 'markdown'}
" plantuml
Plug 'aklt/plantuml-syntax'
" lua
Plug 'nvim-lua/plenary.nvim'
Plug 'tjdevries/nlua.nvim'
" (OPTIONAL): If you want to use built-in LSP (requires Neovim HEAD)
"   Currently only supported LSP, but others could work in future if people send PRs :)
Plug 'neovim/nvim-lspconfig'
" (OPTIONAL): This is recommended to get better auto-completion UX experience for builtin LSP.
Plug 'nvim-lua/completion-nvim'
" (OPTIONAL): This is a suggested plugin to get better Lua syntax highlighting
"   but it's not currently required
Plug 'euclidianAce/BetterLua.vim'
" (OPTIONAL): If you wish to have fancy lua folds, you can check this out.
" Plug 'tjdevries/manillua.nvim'
