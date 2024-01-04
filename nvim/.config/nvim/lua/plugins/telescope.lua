return {

	"nvim-telescope/telescope.nvim",
	version = "0.1.*",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/trouble.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		local trouble = require("trouble.providers.telescope")

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
						["<C-q>"] = trouble.open_selected_with_trouble,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- Telescope keybindings
		local keymap_set = vim.keymap.set
		local opts = { noremap = true }
		keymap_set("n", "<Leader>p", "<Cmd>Telescope git_files<CR>", opts)
		keymap_set("n", "<Leader>fs", ":Telescope grep_string search=", opts)
		keymap_set("n", "<Leader>gs", "<Cmd>Telescope grep_string<CR>", opts)
		keymap_set("n", "<Leader>h", "<Cmd>Telescope oldfiles<CR>", opts)
		keymap_set("n", "<Leader>k", "<Cmd>Telescope keymaps<CR>", opts)
	end,
}
