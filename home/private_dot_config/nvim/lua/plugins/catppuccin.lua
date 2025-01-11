return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	enabled = false,
	-- version = "v1.*", -- blink_cmp integration is not yet released with a tag
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				blink_cmp = true,
				dap = { enabled = true, enable_ui = true },
				flash = true,
				gitsigns = true,
				mason = true,
				mini = { enabled = true },
				treesitter = true,
				which_key = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
