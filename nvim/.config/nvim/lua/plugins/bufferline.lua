return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "v4.*",
	dependencies = {
		"catppuccin",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Go to previous buffer [Bufferline]" },
		{ "<Tab>", "<Cmd>b#<CR>", desc = "Go to alternate buffer [Bufferline]" },
		{ "<Leader>b", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer [Bufferline]" },
		{ "<Leader>bb", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer [Bufferline]" },
		{ "<Leader>bl", ":lua require('telescope.builtin').buffers()<CR>", desc = "List buffers [Bufferline]" },
		{ "<Leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers [Bufferline]" },
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
