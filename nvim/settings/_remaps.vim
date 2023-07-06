" Telescope
nmap <leader>ff <cmd>Telescope find_files<cr>
nmap <leader>fg <cmd>Telescope live_grep<cr>
nmap <leader>fb <cmd>Telescope buffers<cr>
nmap <leader>fh <cmd>Telescope help_tags<cr>
nmap <leader>gf <cmd>Telescope git_files<cr>
nmap <leader>ts <cmd>Telescope treesitter<cr>
nmap <leader>T <cmd>Telescope<cr>
nmap <leader>km <cmd>Telescope keymaps<cr>

" Nerd Tree
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<cr>

imap ij <Esc>:wa<CR>

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
