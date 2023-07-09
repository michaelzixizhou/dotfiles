call plug#begin()
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

    " Utility
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'preservim/nerdcommenter'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'kylechui/nvim-surround'
    Plug 'folke/which-key.nvim'

    " Git blamer
    Plug 'APZelos/blamer.nvim'

    " :MasonUpdate updates registry contents
    Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
    Plug 'williamboman/mason-lspconfig.nvim'
   
    " LSP 
    Plug 'neovim/nvim-lspconfig'
    Plug 'neovim/nvim-lsp'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    " Python debugging
    Plug 'mfussenegger/nvim-dap'
    Plug 'mfussenegger/nvim-dap-python'
    Plug 'rcarriga/nvim-dap-ui'

    " Alphanvim 
    Plug 'goolord/alpha-nvim'
    Plug 'michaelzixizhou/alpha-nvim-fortune'

    " LaTeX
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
    Plug 'hrsh7th/cmp-omni'

    " Status bar and tabline
    Plug 'feline-nvim/feline.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'romgrk/barbar.nvim'
call plug#end()

filetype plugin on

source ~/.config/nvim/settings/_base.vim
source ~/.config/nvim/settings/_remaps.vim
source ~/.config/nvim/settings/_latex.vim
source ~/.config/nvim/settings/_ultisnips.vim

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
