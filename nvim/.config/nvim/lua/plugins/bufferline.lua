return {
	"akinsho/bufferline.nvim",
	version = "v4.*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin",
	},
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				separator_style = "slope",
				diagnostics = "nvim_lsp",
				numbers = "ordinal",
			},
		})

		-- bufferline keybindings
		local keymap_set = vim.keymap.set
		local opts = { noremap = true }
		keymap_set("n", "[b", "<Cmd>BufferLineCyclePrev<CR>", opts)
		keymap_set("n", "]b", "<Cmd>BufferLineCycleNext<CR>", opts)
		keymap_set("n", "[<Tab>", "<Cmd>b#<CR>", opts)
		keymap_set("n", "]<Tab>", "<Cmd>b#<CR>", opts)
		keymap_set("n", "gb", "<Cmd>BufferLinePick<CR>", opts)
	end,
}
