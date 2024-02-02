return {
    {
        "tpope/vim-fugitive",
        cmd = "Git",
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", {} }
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        -- enabled = false,
        event = { "BufReadPre", "BufNewFile", "BufAdd" },
        opts = {}
    }
}
