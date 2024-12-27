return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.ai").setup()
		require("mini.indentscope").setup()
		require("mini.pairs").setup()
		require("mini.icons").setup()
		require("mini.surround").setup()

		require("mini.statusline").setup()
		require("mini.statusline").section_location = function()
			return "%2l:%-2v"
		end

		require("mini.notify").setup()
		vim.notify = require("mini.notify").make_notify()
	end,
}
