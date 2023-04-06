local g = vim.g
local o = vim.o

g.mapleader = ' '
o.termguicolors = true
o.number = true

o.autoindent = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.cindent = true
o.cursorline = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

