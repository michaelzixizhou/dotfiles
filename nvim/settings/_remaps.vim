" Telescope
nmap <leader>ff <cmd>Telescope find_files<cr>
nmap <leader>fg <cmd>Telescope live_grep<cr>
nmap <leader>fb <cmd>Telescope buffers<cr>
nmap <leader>fh <cmd>Telescope help_tags<cr>
nmap <leader>gf <cmd>Telescope git_files<cr>
nmap <leader>ts <cmd>Telescope treesitter<cr>
nmap <leader>T <cmd>Telescope<cr>
nmap <leader>km <cmd>Telescope keymaps<cr>

imap ij <Esc>:wa<CR>

" Nvim Tree
nmap <leader>n <cmd>NvimTreeToggle<cr>
nmap <leader>r <cmd>NvimTreeFocus<cr>

" LSP bindings -> See lspconfig.lua

" Python debugging
nmap <Leader>db <cmd>DapToggleBreakpoint<CR>
nmap <Leader>dpr <cmd>lua require('dap-python').test_method()<CR>

" Bracket completion
inoremap "<tab> ""<left>
inoremap '<tab> ''<left>
inoremap (<tab> ()<left>
inoremap [<tab> []<left>
inoremap [<CR> [<CR>]<ESC>O
inoremap {<tab> {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Reset init.vim
nnoremap <leader>sv :source $MYVIMRC<CR>


function! CleanBufs()
    let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
    if !empty(buffers)
        exe 'bd '.join(buffers, ' ')
    else
        echo 'No buffer deleted'
    endif
endfunction

nnoremap <silent> ,C :call CleanBufs()<CR>


nmap <leader>? <cmd>WhichKey<cr>
