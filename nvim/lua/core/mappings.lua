local keymap = vim.keymap.set
-- keymaps
keymap("n", "<Esc>", "<cmd>noh<cr>", { silent = true } )
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { silent = true } )
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { silent = true } )
keymap("n", "<leader>x", "<cmd>bdelete!<cr>", { silent = true } )
