local opt = vim.opt

-- Theme
vim.cmd [[
    syntax on
    filetype plugin on
]]

opt.termguicolors = true
opt.background = "dark"
opt.cursorline = true
opt.hidden = true
opt.list = true
opt.ttyfast = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.autoindent = true
opt.hlsearch = true
opt.wildmode = "longest,list"
opt.cc = "88"
opt.clipboard = "unnamedplus"
opt.expandtab = true
opt.helplang = 'en'
opt.history = 10000
opt.mouse = "a"
opt.showtabline = 0
opt.number = true
opt.title = true
opt.wrap = true
opt.encoding = "UTF-8"
opt.undofile = true -- Maintain undo history between sessions
opt.undodir = vim.fn.expand(vim.fn.stdpath('data') .. '/undodir')
opt.splitbelow = true
opt.splitright = true
opt.updatetime = 200
opt.shortmess:append({ c = true })
opt.showmode = false
vim.o.signcolumn = "yes:1"
vim.o.timeout = true
vim.o.timeoutlen = 300



vim.g.python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3'
vim.g.python_host_prog = '/Library/Frameworks/Python.framework/Versions/3.11/bin/python3'
