" Theme
syntax on
set t_Co=256
set termguicolors
set background=dark
colorscheme catppuccin
set cursorline
set hidden
set list
set listchars=tab:»·,trail:·
set ttyfast  
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set autoindent
set hlsearch
set wildmode=longest,list
set cc=88
set clipboard=unnamedplus
set expandtab
set helplang=en
set history=10000
set mouse=a
set showtabline=0
set nocompatible
set number
set title
set wrap
set encoding=UTF-8
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
set splitbelow splitright
set updatetime=300
" set guicursor=n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
" Avoid showing message extra message when using completion
set shortmess+=c

let mapleader = ","
let maplocalleader = ","


" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 200

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

if argc() == 0
    autocmd VimEnter * Alpha
else
    autocmd VimEnter * NvimTreeOpen * BarbarEnable
endif

let g:python3_host_prog = '/usr/local/bin/python'
let g:python_host_prog = '/usr/local/bin/python'
