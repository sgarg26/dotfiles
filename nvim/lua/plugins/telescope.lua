return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    cmd = "Telescope",
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>" },
        { "<leader>fw", "<cmd>Telescope live_grep<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>" }
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        pickers = {
            find_files = {
                hidden = false
            }
        },
        defaults = {
            prompt_prefix = "   ",
            selection_caret = "  ",
            sorting_strategy = "ascending",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.5,
                    results_width = 0.5
                }
            },
            path_display = { "truncate" }
        }
    }
}
