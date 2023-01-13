return {

	"nvim-telescope/telescope.nvim",
	version = "0.1.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")

		telescope.setup({
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
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- Telescope keybindings
		local opts = { noremap = true }
		vim.api.nvim_set_keymap("n", "<Leader>p", "<Cmd>Telescope git_files<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>fs", ":Telescope grep_string search=", opts)
		vim.api.nvim_set_keymap("n", "<Leader>gs", "<Cmd>Telescope grep_string<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>hist", "<Cmd>Telescope oldfiles<CR>", opts)
		vim.api.nvim_set_keymap("n", "<Leader>k", "<Cmd>Telescope keymaps<CR>", opts)
	end,
}
