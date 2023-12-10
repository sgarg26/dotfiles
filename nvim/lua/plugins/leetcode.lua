local leet_arg = 'lc'

return {
    'kawre/leetcode.nvim',
    build = ":TSUpdate html",
    lazy = leet_arg ~= vim.fn.argv()[1],
    -- event = "BufEnter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
        "rcarriga/nvim-notify",
    },
    opts = {
        arg = leet_arg,
        lang = "python",
        console = {
            open_on_runcode = true
        }
    },
    config = function(_, opts)
        vim.keymap.set("n", "<leader>lq", "<cmd>Leet tabs<cr>")
        vim.keymap.set("n", "<leader>lc", "<cmd>Leet console<cr>")
        vim.keymap.set("n", "<leader>lr", "<cmd>Leet run<cr>")
        vim.keymap.set("n", "<leader>lt", "<cmd>Leet submit<cr>")
        vim.keymap.set("n", "<leader>ll", "<cmd>Leet lang<cr>")
        vim.keymap.set("n", "<leader>ld", "<cmd>Leet desc toggle<cr>")
        require("leetcode").setup(opts)
    end,
}
