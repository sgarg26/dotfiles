return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
        event = "LspAttach",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        cmd = "Telescope",
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>" },
            { "<leader>fo", "<cmd>Telescope oldfiles<cr>" },
            { "<leader>fw", "<cmd>Telescope live_grep<cr>" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>" },
            { "<leader>mp", "<cmd>Telescope man_pages<cr>" }
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
}
