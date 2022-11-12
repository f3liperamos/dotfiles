local keymap = vim.api.nvim_set_keymap
local opts = {silent = true, noremap=true}

-- set space to also trigger leader key
keymap("", "<Space>", "<Leader>", {})

-- better (?) window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- exit insert mode without having tendinitis
-- and as a bonus, stop cursing the lack of the
-- physical Esc key in the touchbar
keymap("i", "jk", "<Esc>", opts)
keymap("i", "kj", "<Esc>", opts)

-- do not exit indent mode after single indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- prevent pasting to replace the register
keymap("v", "p", '"_dP', opts)

-- toggle file explorer
keymap("n", "<Leader>e", "<Cmd>Lexplore 30<CR>", opts)
