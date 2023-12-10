return {
    {
        'echasnovski/mini.pairs',
        event = "InsertEnter",
        version = false,
        opts = {}
    },
    {
        'echasnovski/mini.animate',
        version = false,
        -- event = { "BufNewFile", "BufAdd", "BufReadPre" },
        event = "CursorMoved",
        opts = {
            scroll = { enable = false }
        }
    }
}
