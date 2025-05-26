local M = {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
}

function M.config()
    local null_ls = require("null-ls")

    null_ls.setup({
        sources = {
            null_ls.builtins.diagnostics.ruff,
            -- null_ls.builtins.diagnostics.mypy,
            null_ls.builtins.formatting.black,
            -- null_ls.builtins.formatting.clang_format,
        },
        offset_encoding = "utf-8",
    })
end

return M
