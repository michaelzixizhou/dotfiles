local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            'JoosepAlviste/nvim-ts-context-commentstring',
        },
    },
}

function M.config()
    require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        highlight = {
            enable = true,
            disable = function(lang, buf)
                local filetypes = { "latex" }
                local function contains(table, element)
                    for _, value in ipairs(table) do
                        if value == element then
                            return true
                        end
                    end
                    return false
                end

                if contains(filetypes, lang) then
                    return true
                end

                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            additional_vim_regex_highlighting = false,
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]["] = "@function.outer",
                    ["]m"] = "@class.outer",
                },
                goto_next_end = {
                    ["]]"] = "@function.outer",
                    ["]M"] = "@class.outer",
                },
                goto_previous_start = {
                    ["[["] = "@function.outer",
                    ["[m"] = "@class.outer",
                },
                goto_previous_end = {
                    ["[]"] = "@function.outer",
                    ["[M"] = "@class.outer",
                },
            },
        },
        rainbow = {
            enable = true,
            extended_mode = true,  -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
            max_file_lines = 2000, -- Do not enable for files with more than 2000 lines, int
        },
        enable_autocmd = false,
        matchup = { enable = true },
    }
end

return M
