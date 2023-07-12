require("plugins/lsp")

return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = true,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = true,
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
            })
        end
    },
    {
        "folke/which-key.nvim",
        config = true
    },
    -- Better `vim.notify()`
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Dismiss all Notifications",
            },
        },
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        },
        init = function()
            vim.notify = require("notify")
        end,
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        'rcarriga/nvim-notify',
        opts = {
            render = "compact",
            stages = "fade",
            minimum_width = 30,
        }
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
            routes = {
                {
                    view = "notify",
                    filter = { event = "msg_showmode" },
                },
            },
            cmdline_popup = {
                position = {
                    row = 5,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
            popupmenu = {
                enabled = true,  -- enables the Noice popupmenu UI
                backend = "cmp", -- backend to use to show regular cmdline completions
                relative = "editor",
                position = {
                    row = 10,
                    col = "50%",
                },
                size = {
                    width = 80,
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        },
    },
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
        dependencies = {
            'Shougo/deoplete.nvim',
            'SirVer/ultisnips',
            'honza/vim-snippets'
        },
        config = function()
            vim.cmd.source('~/.config/nvim/_latex.vim')
        end
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
    },
    {
        "echasnovski/mini.indentscope",
        version = false,     -- wait till new 0.7.0 release to put it back on semver
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
}
