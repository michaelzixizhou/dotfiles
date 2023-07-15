local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>gf', '<cmd>Telescope git_files<cr>')
map('n', '<leader>ts', '<cmd>Telescope treesitter<cr>')
map('n', '<leader>T', '<cmd>Telescope<cr>')
map('n', '<leader>km', '<cmd>Telescope keymaps<cr>')

-- ESC
map('i', 'ij', '<Esc>:wa<CR>', { desc = "ESC and save" })

-- Nvim Tree
map('n', '<leader>n', '<cmd>NvimTreeToggle<cr>')
map('n', '<leader>r', '<cmd>NvimTreeFocus<cr>')

-- Python debugging
map('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>')
map('n', '<leader>dpr', function() require('dap-python').test_method() end)


-- Bracket completion

map('i', "'<tab>", "''<left>")
map('i', '"<tab>', '""<left>')
map('i', ";<tab>", "''<left>")
map('i', '(<tab>', '()<left>')
map('i', '[<tab>', '[]<left>')
map('i', '{<tab>', '{}<left>')
map('i', '[<CR>', '[<CR>]<ESC>O')
map('i', '{<CR>', '{<CR>}<ESC>O')


-- Clean up buffers
map('n', '<Leader>C',
    function()
        local curbufnr = vim.api.nvim_get_current_buf()
        local buflist = vim.api.nvim_list_bufs()
        for _, bufnr in ipairs(buflist) do
            if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then
                vim.cmd('bd ' .. tostring(bufnr))
            end
        end
    end, { silent = true, desc = 'Close unused buffers' })
--[[" Reset init.vim]]
--[[nnoremap <leader>sv :source $MYVIMRC<CR>]]

map('n', '<leader>?', '<cmd>WhichKey<cr>')


--[[nmap <leader>? <cmd>WhichKey<cr>]]
