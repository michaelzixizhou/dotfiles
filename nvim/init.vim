call plug#begin('~/.vim/plugged/')
    " Git status icons
    Plug 'airblade/vim-gitgutter'
    " Fuzzy finder
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    " Theme and coloring
    Plug 'morhetz/gruvbox'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    " Icons for different file types
    Plug 'ryanoasis/vim-devicons'

    " Comment out lines
    Plug 'tpope/vim-commentary'
    
    " NERDTree
    " Plug 'scrooloose/nerdtree'
    Plug 'nvim-tree/nvim-tree.lua'

    " Show error hints and highlights
    Plug 'vim-syntastic/syntastic'

    " Select multiple same items
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " Git blamer
    Plug 'APZelos/blamer.nvim'

    " Markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " :MasonUpdate updates registry contents
    Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
    Plug 'williamboman/mason-lspconfig.nvim'
    
    Plug 'neovim/nvim-lspconfig'
    Plug 'neovim/nvim-lsp'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'goolord/alpha-nvim'
    Plug 'michaelzixizhou/alpha-nvim-fortune'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'lervag/vimtex'
    Plug 'Shougo/deoplete.nvim'
    Plug 'SirVer/ultisnips' 
    Plug 'honza/vim-snippets'

    " Completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    Plug 'feline-nvim/feline.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'hrsh7th/cmp-omni'
    
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'romgrk/barbar.nvim'
    Plug 'mfussenegger/nvim-dap'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

filetype plugin on

source ~/.config/nvim/settings/_base.vim
source ~/.config/nvim/settings/_remaps.vim
source ~/.config/nvim/settings/_latex.vim
source ~/.config/nvim/settings/_ultisnips.vim
source ~/.config/nvim/settings/_startify.vim

luafile ~/.config/nvim/lua/_felinebar.lua
luafile ~/.config/nvim/lua/_nvimcmp.lua
luafile ~/.config/nvim/lua/_webdevicons.lua
luafile ~/.config/nvim/lua/_gitsigns.lua
luafile ~/.config/nvim/lua/_mason.lua
luafile ~/.config/nvim/lua/_lspconfig.lua
luafile ~/.config/nvim/lua/_null_ls.lua
luafile ~/.config/nvim/lua/_telescope.lua
luafile ~/.config/nvim/lua/_nvim-dap.lua
luafile ~/.config/nvim/lua/_treesitter.lua
luafile ~/.config/nvim/lua/_nvim-colorizer.lua
luafile ~/.config/nvim/lua/_catppuccin.lua
luafile ~/.config/nvim/lua/_nvim-tree.lua
luafile ~/.config/nvim/lua/_alphanvim.lua
