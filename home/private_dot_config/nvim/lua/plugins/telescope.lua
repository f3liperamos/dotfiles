return {
	enabled = false, -- testing fzf lua?
	"nvim-telescope/telescope.nvim",
	version = "0.1.*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				sorting_strategy = "ascending",
				layout_strategy = "vertical",
				layout_config = {
					prompt_position = "top",
					width = 0.95,
					height = 0.95,
					mirror = true,
					preview_cutoff = 0,
				},
			},
			extensions = {
				["ui-select"] = require("telescope.themes").get_dropdown(),
			},
		})

		pcall(telescope.load_extension, "fzf")
		pcall(telescope.load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<Leader>sh", builtin.help_tags, { desc = "[s]earch [h]elp" })
		vim.keymap.set("n", "<Leader>sk", builtin.keymaps, { desc = "[s]earch [k]eymaps" })
		vim.keymap.set("n", "<Leader>sf", builtin.find_files, { desc = "[s]earch [f]iles" })
		vim.keymap.set("n", "<Leader>ss", builtin.builtin, { desc = "[s]earch [s]elect Telescope" })
		vim.keymap.set("n", "<Leader>sw", builtin.grep_string, { desc = "[s]earch current [w]ord" })
		vim.keymap.set("n", "<Leader>sg", builtin.live_grep, { desc = "[s]earch by [g]rep" })
		vim.keymap.set("n", "<Leader>sd", builtin.diagnostics, { desc = "[s]earch [d]iagnostics" })
		vim.keymap.set("n", "<Leader>sr", builtin.resume, { desc = "[s]earch [r]esume" })
		vim.keymap.set("n", "<Leader>s.", builtin.oldfiles, { desc = "[s.]earch recent files" })
		vim.keymap.set("n", "<Leader><Leader>", builtin.buffers, { desc = "[ ] find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find({ previewer = false })
		end, { desc = "[/] fuzzy search in current buffer" })

		-- Shortcut for searching your neovim configuration files
		vim.keymap.set("n", "<Leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[s]earch [n]eovim config" })
	end,
}
