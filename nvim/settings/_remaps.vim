nmap <leader>ff <cmd>Telescope find_files<cr>
nmap <leader>fg <cmd>Telescope live_grep<cr>
nmap <leader>fb <cmd>Telescope buffers<cr>
nmap <leader>fh <cmd>Telescope help_tags<cr>
nmap <leader>gf <cmd>Telescope git_files<cr>
nmap <leader>D <cmd>Telescope lsp_definitions<cr>
nmap <leader>I <cmd>Telescope lsp_implementations<cr>
nmap <leader>ts <cmd>Telescope treesitter<cr>
nmap <leader>fs <cmd>Telescope planets<cr>
nmap <leader>km <cmd>Telescope keymaps<cr>
nmap <Leader>n :NERDTreeToggle<CR>
imap ij <Esc>:wa<CR>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

inoremap "<tab> ""<left>
inoremap '<tab> ''<left>
inoremap (<tab> ()<left>
inoremap [<tab> []<left>
inoremap {<tab> {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

