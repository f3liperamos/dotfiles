require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "catppuccin",
	},
	sections = {
		lualine_c = {
			{ "filename", path = 1 },
		},
	},
})
