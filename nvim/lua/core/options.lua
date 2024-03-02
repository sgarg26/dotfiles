local opt = vim.opt
local g = vim.g
local o = vim.o
local keymap = vim.keymap.set

g.mapleader = " "

-- indent settings
o.tabstop = 4 -- A TAB character looks like 4 spaces
o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
o.shiftwidth = 4 -- Number of spaces inserted when indenting
o.cmdheight = 0
o.pumheight = 10

-- Search settings
o.ignorecase = true
o.smartcase = true

-- Save undo history
o.undofile = true
o.clipboard = "unnamedplus"

opt.laststatus = 3
opt.showmode = false
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.scrolloff = 3
opt.sidescrolloff = 3

-- Enable absolute line numbers
vim.wo.nu = true
-- Configuration for diagnostics
local signs = {
	{ name = "DiagnosticSignError", text = " " },
	{ name = "DiagnosticSignWarn", text = " " },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = " " },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	signs = {
		active = signs, -- show signs
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "single",
		source = "always",
		header = "Diagnostic",
		prefix = "",
	},
}

vim.diagnostic.config(config)
