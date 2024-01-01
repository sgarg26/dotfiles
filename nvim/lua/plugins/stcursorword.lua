return {
    "sontungexpt/stcursorword",
    event = "LspAttach",
    opts = {
        excluded = {
            filetypes = {
                "dashboard",
                "TelescopePrompt",
                "help",
                "neo-tree",
                "leetcode.nvim"
            }
        },
        highlight = {
            underline = false,
            bg = "#36454f"
        }
    },
    config = true,
}
