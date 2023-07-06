" Launch NERDTree on start-up
if argc() == 0
    " Run function A
    autocmd VimEnter * Startify
else
    " Run function B
    autocmd VimEnter * NERDTree
endif

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

let g:NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter="\u00a0"
