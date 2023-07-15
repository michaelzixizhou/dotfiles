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
			disable = function(ft, bufnr)
				if vim.tbl_contains({ "vim" }, ft) then
					return true
				end

				local ok, is_large_file = pcall(vim.api.nvim_buf_get_var, bufnr, "bigfile_disable_treesitter")
				return ok and is_large_file
			end,
			additional_vim_regex_highlighting = { "c", "cpp" },
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
			extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
			max_file_lines = 2000, -- Do not enable for files with more than 2000 lines, int
		},
		context_commentstring = { enable = true, enable_autocmd = false },
		matchup = { enable = true },
        -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" },
        --
        -- highlight = {
        --     enable = true,
        --     additional_vim_regex_highlighting = false,
        -- },
        --
        -- context_commentstring = {
        --     enable = true,
        --:w
        --},
        -- textobjects = {
        --     select = {
        --         enable = true,
        --         disable =function(ft, bufnr)
        --            return vim.api.nvim_buf_line_count(bufnr) > 10000
        --         end,
        --
        --         -- Automatically jump forward to textobj, similar to targets.vim
        --         lookahead = true,
        --
        --         keymaps = {
        --             -- You can use the capture groups defined in textobjects.scm
        --             ["af"] = "@function.outer",
        --             ["if"] = "@function.inner",
        --             ["ac"] = "@class.outer",
        --             -- You can optionally set descriptions to the mappings (used in the desc parameter of
        --             -- nvim_buf_set_keymap) which plugins like which-key display
        --             ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        --             -- You can also use captures from other query groups like `locals.scm`
        --             ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
        --         },
        --         selection_modes = {
        --             ['@parameter.outer'] = 'v', -- charwise
        --             ['@function.outer'] = 'V',  -- linewise
        --             ['@class.outer'] = '<c-v>', -- blockwise
        --         },
        --         include_surrounding_whitespace = true,
        --     },
        --     swap = {
        --         enable = true,
        --         swap_next = {
        --             ["<leader>a"] = "@parameter.inner",
        --         },
        --         swap_previous = {
        --             ["<leader>A"] = "@parameter.inner",
        --         },
        --     },
        --     move = {
        --         enable = true,
        --         set_jumps = true, -- whether to set jumps in the jumplist
        --         goto_next_start = {
        --             ["]m"] = "@function.outer",
        --             ["]]"] = { query = "@class.outer", desc = "Next class start" },
        --             --
        --             -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
        --             ["]o"] = "@loop.*",
        --             -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
        --             --
        --             -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
        --             -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
        --             ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        --             ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        --         },
        --         goto_next_end = {
        --             ["]M"] = "@function.outer",
        --             ["]["] = "@class.outer",
        --         },
        --         goto_previous_start = {
        --             ["[m"] = "@function.outer",
        --             ["[["] = "@class.outer",
        --         },
        --         goto_previous_end = {
        --             ["[M"] = "@function.outer",
        --             ["[]"] = "@class.outer",
        --         },
        --         -- Below will go to either the start or the end, whichever is closer.
        --         -- Use if you want more granular movements
        --         -- Make it even more gradual by adding multiple queries and regex.
        --         goto_next = {
        --             ["]d"] = "@conditional.outer",
        --         },
        --         goto_previous = {
        --             ["[d"] = "@conditional.outer",
        --         }
        --     },
        -- },
    }
end

return M
