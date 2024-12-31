return {
	{ "echasnovski/mini.ai", opts = {}, version = false },
	{ "echasnovski/mini.icons", opts = {}, version = false },
	{ "echasnovski/mini.indentscope", opts = {}, version = false },
	{ "echasnovski/mini.surround", opts = {}, version = false },
	{
		"echasnovski/mini.statusline",
		version = false,
		config = function()
			require("mini.statusline").setup()
			require("mini.statusline").section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
	{
		"echasnovski/mini.notify",
		version = false,
		config = function()
			require("mini.notify").setup()
			vim.notify = require("mini.notify").make_notify()
		end,
	},
}
