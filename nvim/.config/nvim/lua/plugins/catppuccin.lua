return {
	{
		"catppuccin/nvim",
		version = "v1.*",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					dashboard = true,
					gitsigns = true,
					mason = true,
					notify = true,
					nvimtree = true,
					telescope = true,
					treesitter = true,
					which_key = true,

					-- special integrations, check their .lua
					bufferline = true,
					fidget = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
