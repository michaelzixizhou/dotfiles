require("config/lazybootstrap")
require("config")

local opts = {
    ui = {
        border = "rounded"
    },
    change_detection = { enabled = false }
}

require("lazy").setup("plugins", opts)
