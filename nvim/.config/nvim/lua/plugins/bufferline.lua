return {
	"akinsho/bufferline.nvim",
	version = "v2.*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "catppuccin/nvim", version = "v0.2", name = "catppuccin" },
	},
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				separator_style = "slant",
				numbers = function(opts)
					return string.format("%s", opts.ordinal)
				end,
			},
		})

		-- bufferline keybindings
		local opts = { noremap = true }
		vim.api.nvim_set_keymap("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", opts)
		vim.api.nvim_set_keymap("n", "]b", "<Cmd>BufferLineCycleNext<CR>", opts)
		vim.api.nvim_set_keymap("n", "[<Tab>", "<Cmd>b#<CR>", opts)
		vim.api.nvim_set_keymap("n", "]<Tab>", "<Cmd>b#<CR>", opts)
		vim.api.nvim_set_keymap("n", "gb", "<Cmd>BufferLinePick<CR>", opts)
	end,
}
