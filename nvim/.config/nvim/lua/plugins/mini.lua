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
		opts = {
			mappings = {
				add = "gza", -- Add surrounding in Normal and Visual modes
				delete = "gzd", -- Delete surrounding
				find = "gzf", -- Find surrounding (to the right)
				find_left = "<Leader>gzF", -- Find surrounding (to the left)
				highlight = "gzh", -- Highlight surrounding
				replace = "gzr", -- Replace surrounding
				update_n_lines = "gzn", -- Update `n_lines`
			},
		},
	},
}
