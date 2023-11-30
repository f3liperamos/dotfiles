local keymap_set = vim.keymap.set
local opts = { silent = true, noremap = true }

---@param rhs table
local extend_opts = function(rhs)
	rhs = rhs or {}
	return vim.tbl_deep_extend("force", opts, rhs)
end

keymap_set("v", "<C-c>", '"*y', extend_opts({ desc = 'Copy selection to "* register' }))
keymap_set("n", "<C-h>", "<C-w>h", extend_opts({ desc = "Go to the left window" }))
keymap_set("n", "<C-j>", "<C-w>j", extend_opts({ desc = "Go to the down window" }))
keymap_set("n", "<C-k>", "<C-w>k", extend_opts({ desc = "Go to the up window" }))
keymap_set("n", "<C-l>", "<C-w>l", extend_opts({ desc = "Go to the right window" }))

-- set space to also trigger leader key
keymap_set("n", "<Space>", "<Leader>", { remap = true })

-- insert mode quick exit
keymap_set("i", "jk", "<Esc>", opts)
keymap_set("i", "kj", "<Esc>", opts)

-- stay on visual mode when indenting
keymap_set("v", "<", "<gv", opts)
keymap_set("v", ">", ">gv", opts)

-- do not replace the register when pasting
keymap_set("v", "p", '"_dP', opts)

-- center screen after scrolling, jumping matches
keymap_set("n", "<C-u>", "<C-u>zz", opts)
keymap_set("n", "<C-d>", "<C-d>zz", opts)
keymap_set("n", "n", "nzz", opts)
keymap_set("n", "N", "Nzz", opts)
