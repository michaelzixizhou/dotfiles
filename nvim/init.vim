call plug#begin('~/.vim/plugged/')
    " Git status icons
    Plug 'airblade/vim-gitgutter'
    " Fuzzy finder
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    " Theme and coloring
    Plug 'morhetz/gruvbox'

    " Icons for different file types
    Plug 'ryanoasis/vim-devicons'

    " Comment out lines
    Plug 'tpope/vim-commentary'

    " NERDTree
    Plug 'scrooloose/nerdtree'

    " Show error hints and highlights
    Plug 'vim-syntastic/syntastic'

    " Select multiple same items
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " Git blamer
    Plug 'APZelos/blamer.nvim'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    Plug 'neovim/nvim-lspconfig'
    Plug 'neovim/nvim-lsp'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'lervag/vimtex'
    Plug 'Shougo/deoplete.nvim'
    Plug 'SirVer/ultisnips' 
    Plug 'honza/vim-snippets'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'feline-nvim/feline.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'hrsh7th/cmp-omni'

    Plug 'romgrk/barbar.nvim'
call plug#end()

filetype plugin on


source ~/.config/nvim/settings/_base.vim
source ~/.config/nvim/settings/_remaps.vim
source ~/.config/nvim/settings/_nerdtree.vim
source ~/.config/nvim/settings/_remaps.vim

" Use homebrew's clangd
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'

" LaTeX
')
luafile ~/.config/nvim/lua/_felinebar.lua
luafile ~/.config/nvim/lua/_nvimcmp.lua
luafile ~/.config/nvim/lua/_webdevicons.lua
luafile ~/.config/nvim/lua/_gitsigns.lua
luafile ~/.config/nvim/lua/_lspconfig.lua
luafile ~/.config/nvim/lua/_felinebar.lua

