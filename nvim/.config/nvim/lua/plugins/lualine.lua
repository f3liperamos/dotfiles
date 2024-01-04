return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "catppuccin" },
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
