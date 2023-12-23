local keymap = vim.keymap.set

-- General keymaps
keymap("n", "<Esc>", "<cmd>noh<cr>", { silent = true } ) -- map esc to no highlighting
keymap("i", "<S-Tab>", "<C-d>", { silent = true } ) -- map shift-tab to reverse indent like vscode
keymap("n", "<leader>ll", "<cmd>Lazy<cr>", {})
keymap("n", "<leader>mm", "<cmd>Mason<cr>", {})

-- Bufferline keymaps
keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { silent = true } )
keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { silent = true } )
keymap("n", "<leader>x", "<cmd>bdelete!<cr>", { silent = true } )

-- Lsp keymaps
local buf = vim.lsp.buf
keymap("n", "K", "<cmd>Lspsaga hover_doc<cr>", {})
keymap("n", "<leader>rn", buf.rename, {})
keymap("n", "<leader>gD", buf.declaration, {})
keymap("n", "<leader>gd", buf.definition, {})
keymap("n", "<leader>gi", buf.implementation, {})
keymap("n", "<leader>ca", buf.code_action, {})
