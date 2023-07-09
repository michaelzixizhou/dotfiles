local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "󰍉  > Find file", ":cd $HOME/Desktop/Workspace/| Telescope find_files<CR>"),
    dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("i", "  > init.vim", ":e $MYVIMRC | :cd ~/.config/nvim<CR> | :NvimTreeOpen<CR>"),
    dashboard.button("a", "  > alacritty.yml", ":cd ~/.config/alacritty | :e alacritty.yml<CR>"),
    dashboard.button("t", "  > tmux.conf", ":cd ~/ | :e .tmux.conf<CR>"),
    dashboard.button("z", "󰰶  > zshrc", ":cd ~/ | :e .zshrc<CR>"),
    dashboard.button("s", "  > Snippets", ":cd ~/.config/nvim/mysnippets<CR>"),
    dashboard.button("q", "󰠜  > Quit NVIM", ":qa<CR>"),
}

local fortune = require("alpha.fortune")


local function footer()
    local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/plugged/", "*", 0, 1))
    local datetime = os.date("  %m-%d-%Y   %H:%M:%S")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
    return " " .. datetime .. "   Plugins: " .. plugins_count .. nvim_version_info
end

dashboard.section.footer.val = {
    footer(),
    unpack(fortune()),
}
-- footer(),
-- fortune()


-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
