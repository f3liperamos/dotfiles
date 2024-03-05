return {
	{
		"catppuccin/nvim",
		version = "v1.*",
		event = "VimEnter",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
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
