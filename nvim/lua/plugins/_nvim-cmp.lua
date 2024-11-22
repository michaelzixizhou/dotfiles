return {
    {
        "hrsh7th/nvim-cmp",
        version = false, -- last release is way too old
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            'SirVer/ultisnips',
            "quangnguyen30192/cmp-nvim-ultisnips",
            "hrsh7th/cmp-omni",
            "ray-x/cmp-treesitter"
        },
        config = function()
            vim.g.UltiSnipsExpandTrigger = '<Tab>'

            require("cmp_nvim_ultisnips").setup {}
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert {
                    ["<tab>"] = cmp.mapping.confirm { select = true },
                    ["<c-e>"] = cmp.mapping.abort(),
                    ["<esc>"] = cmp.mapping.close(),
                    ["<c-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<c-f>"] = cmp.mapping.scroll_docs(4),
                },

                sources = cmp.config.sources({
                    { name = 'nvim_lsp',               priority = 10 },
                    { name = 'ultisnips',              priority = 15 }, -- For ultisnips users.
                    { name = 'buffer' },
                    { name = 'omni',                   priority = 25 },
                    { name = 'nvim_lsp_signature_help' },
                    { name = 'path',                   priority = 20 },
                    { name = 'treesitter',             priority = 5 },
                    { name = '' },
                    { name = "copilot",                priority = 23 },
                }),
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        vim_item.menu = ({
                            nvim_lsp = "[LSP]",
                            ultisnips = "[Snippet]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                            omni = "[Omni]",
                            nvim_lsp_signature_help = "[LSP]",
                            treesitter = "[Treesitter]",
                            copilot = "[Copilot]",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                completion = {
                    keyword_length = 1,
                },
            })

            -- Set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                })
            })
        end
    }
}
