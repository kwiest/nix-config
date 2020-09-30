filetype plugin indent on
syntax on
colorscheme nord

set encoding=utf-8

" Set leader key to ','
let mapleader=","

" Tabs and spaces
set expandtab     " Expand a tab into spaces
set tabstop=2     " 2 spaces
set softtabstop=2 " Soft tabs
set shiftwidth=2  " How many columns when using '>' and '<'

set number        " Show line numbers
set ruler         " Show the line and column number of the cursor
set cmdheight=2   " Number of lines to use for the command line
set nowrap        " Don't line-wrap, you have to scroll!
set showmatch     " Show matching parens
set textwidth=80  " Line break at 80 by default

" Visual highlight mode
:highlight Visual cterm=reverse ctermbg=NONE

" Highlight trailing whitespace and spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

set backspace=indent,eol,start

" Searching
set incsearch  " Incremental search
set hlsearch   " Highlight search results
set ignorecase " No case-sensitivity
set smartcase  " Unless you start with a capital letter

" Remove search highlights with Enter
nmap <CR> :nohlsearch<cr>

" Toggle NERDTree File Explorer
map <leader>q :NERDTreeToggle<CR>

" fzf Fuzzy finder
map <leader>f :Files<CR>

" Ripgrep Search
let g:rg_command = 'rg --vimgrep -S'

" Use system clipboard for copy/paste
set clipboard=unnamed
