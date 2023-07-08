let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 't': '~/.tmux.conf'},
            \ { 's': '~/.config/nvim/mysnippets/'},
            \ { 'a': '~/.config/alacritty/alacritty.yml'},
            \ ]

let g:startify_fortune_use_unicode = 1
let g:startify_enable_special = 0

let g:startify_custom_header = [
    \"                                                     ",
    \"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    \"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    \"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    \"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    \"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    \"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    \"                                                     ",
    \]


if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

if argc() == 0
    autocmd VimEnter * Startify
else
    autocmd VimEnter * NvimTreeOpen
endif
