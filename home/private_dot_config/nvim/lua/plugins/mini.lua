return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.icons").setup()
		require("mini.sessions").setup()
		require("mini.indentscope").setup()

		require("mini.notify").setup()
		vim.notify = require("mini.notify").make_notify()

		require("mini.statusline").setup()
		require("mini.statusline").section_location = function()
			return "%2l:%-2v"
		end

		require("mini.surround").setup({
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		})
	end,
}
