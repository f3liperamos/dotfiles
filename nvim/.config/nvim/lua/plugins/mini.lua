local mini_starter_header = [[
███████╗██╗   ██╗███╗   ██╗██╗  ██╗███████╗███╗   ██╗     ██████╗ ██████╗ ███████╗████████╗
██╔════╝██║   ██║████╗  ██║██║ ██╔╝██╔════╝████╗  ██║    ██╔════╝██╔═══██╗██╔════╝╚══██╔══╝
███████╗██║   ██║██╔██╗ ██║█████╔╝ █████╗  ██╔██╗ ██║    ██║     ██║   ██║███████╗   ██║   
╚════██║██║   ██║██║╚██╗██║██╔═██╗ ██╔══╝  ██║╚██╗██║    ██║     ██║   ██║╚════██║   ██║   
███████║╚██████╔╝██║ ╚████║██║  ██╗███████╗██║ ╚████║    ╚██████╗╚██████╔╝███████║   ██║   
╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝     ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝   
]]

return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup()
		require("mini.indentscope").setup()
		require("mini.pairs").setup()
		require("mini.starter").setup({ header = mini_starter_header })
		require("mini.surround").setup()

		require("mini.statusline").setup()
		require("mini.statusline").section_location = function()
			return "%2l:%-2v"
		end

		require("mini.notify").setup()
		vim.notify = require("mini.notify").make_notify()
	end,
}
