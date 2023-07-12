local M = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }
}

function M.config()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1


    local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"

        --[[    local function opts(desc)]]
        --[[return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }]]
        --[[end]]

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
    end

    -- OR setup with some options
    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
        filters = {
            dotfiles = false,
            custom = {
                "DS_Store",
                "node_modules"
            }
        },
        on_attach = my_on_attach,
    })
end

return M
