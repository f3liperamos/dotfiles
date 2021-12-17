local actions = require("telescope.actions")
require("telescope").setup({
	defaults = {
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
			height = 0.9,
			width = 0.9,
		},
		mappings = {
			i = {
				["<Esc>"] = actions.close,
				["<C-k>"] = actions.move_selection_previous,
				["<C-j>"] = actions.move_selection_next,
			},
		},
	},
})

-- Telescope keybindings
local opts = { noremap = true }
vim.api.nvim_set_keymap("n", "<Leader>p", "<Cmd>Telescope git_files<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>gs", "<Cmd>Telescope grep_string<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>hist", "<Cmd>Telescope oldfiles<CR>", opts)
vim.api.nvim_set_keymap("n", "<Leader>k", "<Cmd>Telescope keymaps<CR>", opts)
