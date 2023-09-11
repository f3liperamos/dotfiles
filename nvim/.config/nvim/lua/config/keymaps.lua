local keymap_set = vim.keymap.set
local opts = { silent = true, noremap = true }

-- set space to also trigger leader key
keymap_set("n", "<Space>", "<Leader>", { remap = true })

-- better (?) window navigation
keymap_set("n", "<C-h>", "<C-w>h", opts)
keymap_set("n", "<C-j>", "<C-w>j", opts)
keymap_set("n", "<C-k>", "<C-w>k", opts)
keymap_set("n", "<C-l>", "<C-w>l", opts)

-- exit insert mode without having tendinitis
-- and as a bonus, stop cursing the lack of the
-- physical Esc key in the touchbar
keymap_set("i", "jk", "<Esc>", opts)
keymap_set("i", "kj", "<Esc>", opts)

-- do not exit indent mode after single indent
keymap_set("v", "<", "<gv", opts)
keymap_set("v", ">", ">gv", opts)

-- prevent pasting to replace the register
keymap_set("v", "p", '"_dP', opts)

-- toggle file explorer
keymap_set("n", "<C-e>", "<Cmd>Lexplore 30<CR>", opts)

-- center screen after scrolling, jumping matches
keymap_set("n", "<C-u>", "<C-u>zz", opts)
keymap_set("n", "<C-d>", "<C-d>zz", opts)
keymap_set("n", "n", "nzz", opts)
keymap_set("n", "N", "Nzz", opts)

-- Mapping "*y to CTRL_C because I was never able to do it efficiently
keymap_set("v", "<C-c>", '"*y<CR>', opts)
