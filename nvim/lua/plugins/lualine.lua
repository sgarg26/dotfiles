return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		return {
			options = {
				theme = "tokyonight",
				disabled_filetypes = { statusline = { "dashboard" } },
			},
            -- stylua: ignore
			sections = {
				lualine_a = { function() return "" end, "mode" },
			},
		}
	end,
}
