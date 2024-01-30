require('core.options')
require('core.mappings')
require('core.lazy')
require('core.autocommands')

-- local plugins = require("plugins")
require("lazy").setup("plugins", {
    defaults = {
        lazy = true
    },
    install = {
        colorscheme = { "tokyonight" }
    },
    ui = {
        border = "rounded"
    }
})
