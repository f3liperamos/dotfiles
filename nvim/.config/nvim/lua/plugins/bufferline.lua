return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "v4.*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin",
	},
	keys = {
		{ "[b",         "<Cmd>BufferLineCyclePrev<CR>",   desc = "Go to next buffer" },
		{ "]b",         "<Cmd>BufferLineCycleNext<CR>",   desc = "Go to previous buffer" },
		{ "[Tab",       "<Cmd>b#<CR>",                    desc = "Go to alternate buffer" },
		{ "]Tab",       "<Cmd>b#<CR>",                    desc = "Go to alternate buffer" },
		{ "gb",         "<Cmd>BufferLinePick<CR>",        desc = "Pick buffer" },
		{ "<Leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" }
	},
	config = function()
		require("bufferline").setup({
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
			options = {
				separator_style = "slope",
				diagnostics = "nvim_lsp",
			},
		})
	end,
}
