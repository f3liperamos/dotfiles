return {
	{
		"catppuccin/nvim",
		version = "v1.4",
		name = "catppuccin",
		config = function()
			local notify = require("util.notify")
			local status_ok, catppuccin = pcall(require, "catppuccin")
			if not status_ok then
				notify("catppuccin not found", "error", { title = "failed to load colorscheme" })
				return
			end

			catppuccin.setup({
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
