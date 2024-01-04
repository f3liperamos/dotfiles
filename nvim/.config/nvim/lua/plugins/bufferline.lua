return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "v4.*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"catppuccin",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Go to previous buffer" },
		{ "<Tab>", "<Cmd>b#<CR>", desc = "Go to alternate buffer" },
		{ "<Leader>b", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer" },
		{ "<Leader>bb", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer" },
		{ "<Leader>bl", ":lua require('telescope.builtin').buffers()<CR>", desc = "List buffers" },
		{ "<Leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
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
