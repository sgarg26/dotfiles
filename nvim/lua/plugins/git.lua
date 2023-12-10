return {
    {
        "tpope/vim-fugitive",
        cmd = "Git",
        config = function() require("vim-fugitive").setup() end
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
        event = { "BufReadPre", "BufNewFile", "BufAdd" },
        opts = {}
    }
}
