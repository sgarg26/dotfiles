return {
    "sontungexpt/stcursorword",
    event = "LspAttach",
    opts = {
        excluded = {
            filetypes = {
                "dashboard",
                "TelescopePrompt",
                "help",
                "neo-tree"
            }
        },
        highlight = {
            underline = false,
            bg = "#36454f"
        }
    },
    config = true,
}
