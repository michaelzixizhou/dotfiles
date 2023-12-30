require("plugins/lsp")

return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true
    },
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
                keymaps = {
                    insert = "<C-g>s",
                    insert_line = "<C-g>S",
                    normal = "<leader>s",
                    normal_cur = "<leader>ss",
                    normal_line = "<leader>S",
                    normal_cur_line = "<leader>SS",
                    visual = "S",
                    visual_line = "gS",
                    delete = "<leader>ds",
                    change = "<leader>cs",
                },
            })
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    -- Better `vim.notify()`
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        }
    },
    {
        "numToStr/Comment.nvim", config = true
    },
    {
        "lervag/vimtex",
        config = function()
            vim.cmd.source('~/.config/nvim/_latex.vim')
        end,
        dependencies = {
            'honza/vim-snippets'
        }
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- char = "▏",
            char = "│",
            filetype_exclude = {
                "help",
                "alpha",
                "dashboard",
                "NvimTree",
                "Trouble",
                "lazy",
                "mason",
                "notify",
            },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            -- default configuration
            require('illuminate').configure({
                -- providers: provider used to get references in the buffer, ordered by priority
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                -- delay: delay in milliseconds
                delay = 10,
                filetype_overrides = {},
                -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
                filetypes_denylist = {
                    'NvimTree',
                    'Telescope',
                    'lazy',
                    'help',
                    'alpha',
                    'Trouble'
                },
                under_cursor = true,
                large_file_cutoff = nil,
                large_file_overrides = nil,
                min_count_to_highlight = 1,
            })
        end
    },
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "help",
                    "alpha",
                    "dashboard",
                    "NvimTree",
                    "Trouble",
                    "lazy",
                    "mason",
                    "notify",
                },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
    },
    {
        "github/copilot.vim",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
}
