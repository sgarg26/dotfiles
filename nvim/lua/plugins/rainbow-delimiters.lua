return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "LspAttach",
	config = function()
		vim.cmd.edit({ bang = true })
	end,
}
