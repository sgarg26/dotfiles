local keymap = vim.keymap.set

-- General keymaps
keymap("n", "<Esc>", "<cmd>noh<cr>", { silent = true } ) -- map esc to no highlighting
keymap("i", "<S-Tab>", "<C-d>", { silent = true } ) -- map shift-tab to reverse indent like vscode

-- Bufferline keymaps
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { silent = true } )
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { silent = true } )
keymap("n", "<leader>x", "<cmd>bdelete!<cr>", { silent = true } )

