return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        theme = "tokyonight",
        options = {
            disabled_filetypes = { statusline = { "dashboard" } }
        }
    }
}
