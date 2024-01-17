local mini_starter_header = [[
███████╗██╗   ██╗███╗   ██╗██╗  ██╗███████╗███╗   ██╗     ██████╗ ██████╗ ███████╗████████╗
██╔════╝██║   ██║████╗  ██║██║ ██╔╝██╔════╝████╗  ██║    ██╔════╝██╔═══██╗██╔════╝╚══██╔══╝
███████╗██║   ██║██╔██╗ ██║█████╔╝ █████╗  ██╔██╗ ██║    ██║     ██║   ██║███████╗   ██║   
╚════██║██║   ██║██║╚██╗██║██╔═██╗ ██╔══╝  ██║╚██╗██║    ██║     ██║   ██║╚════██║   ██║   
███████║╚██████╔╝██║ ╚████║██║  ██╗███████╗██║ ╚████║    ╚██████╗╚██████╔╝███████║   ██║   
╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝     ╚═════╝ ╚═════╝ ╚══════╝   ╚═╝   
]]

return {
	{
		"echasnovski/mini.pairs",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.indentscope",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.notify",
		version = false, -- No stable version yet
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("mini.notify").setup(opts)
			vim.notify = require("mini.notify").make_notify(opts)
		end,
	},
	{
		"echasnovski/mini.starter",
		version = "*",
		event = "VimEnter",
		opts = {
			header = mini_starter_header,
		},
	},
}
