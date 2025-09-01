return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		version = "v1.*",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					blink_cmp = true,
					dap = { enabled = true, enable_ui = true },
					flash = true,
					mason = true,
					mini = { enabled = true },
					treesitter = true,
					which_key = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		enabled = false,
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		name = "rose-pine",
		config = function()
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}
