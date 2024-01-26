return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            theme = "tokyonight",
            disabled_filetypes = { statusline = { "dashboard" } }
        }
    }
}
