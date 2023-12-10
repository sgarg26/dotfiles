return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufNewFile", "BufReadPre", "BufAdd" },
    config = function()
        require "ibl".overwrite {
            exclude = { filetypes = { "dashboard", "help" } },
            scope = { exclude = { language = { "lua", "python", "c", "haskell" } } }
        }
    end
}
