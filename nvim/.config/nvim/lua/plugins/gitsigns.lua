return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		version = "v0.5",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
