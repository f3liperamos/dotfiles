return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		version = "v1.*",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
				integrations = {
					cmp = true,
					dap = { enabled = true, enable_ui = true },
					flash = true,
					gitsigns = true,
					mason = true,
					mini = { enabled = true },
					telescope = { enabled = true },
					treesitter = true,
					which_key = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
