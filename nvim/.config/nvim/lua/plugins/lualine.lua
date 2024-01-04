return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "catppuccin" },
	event = "VeryLazy",
	opts = {
		{
			options = {
				icons_enabled = false,
				theme = "catppuccin",
			},
			sections = {
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
		},
	},
}
