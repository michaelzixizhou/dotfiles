" Theme
syntax on
colorscheme gruvbox
set background=dark
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
set cc=80
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

" Avoid showing message extra message when using completion
set shortmess+=c

let mapleader = ","
let maplocalleader = ","


" Git blamer
let g:blamer_enabled = 1
let g:blamer_delay = 200
