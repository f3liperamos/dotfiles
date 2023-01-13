return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "catppuccin/nvim", version = "v0.2", name = "catppuccin" },
	},
	config = function()
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
	end,
}
