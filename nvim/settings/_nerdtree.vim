" Launch NERDTree on start-up
if argc() == 0
    " Run function A
    autocmd VimEnter * Startify
else
    " Run function B
    autocmd VimEnter * NERDTree
endif

let g:NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter="\u00a0"
