return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        version = false,
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c",
                "lua",
                "python"
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    }
}
