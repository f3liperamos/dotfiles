return {
	{
		"catppuccin/nvim",
		lazy = true,
		version = "v1.*",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				integrations = {
					cmp = true,
					dap = { enabled = true, enable_ui = true },
					flash = true,
					gitsigns = true,
					lsp_trouble = true,
					mason = true,
					mini = true,
					notify = true,
					telescope = { enabled = true },
					treesitter = true,
					which_key = true,
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
