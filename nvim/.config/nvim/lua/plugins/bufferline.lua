return {
	enabled = false,
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	version = "v4.*",
	dependencies = {
		"catppuccin",
		"nvim-telescope/telescope.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Bufferline: Go to previous buffer" },
		{ "<Tab>", "<Cmd>b#<CR>", desc = "Bufferline: Go to alternate buffer" },
		{ "<Leader>bb", "<Cmd>BufferLinePick<CR>", desc = "Bufferline: Pick buffer" },
		{ "<Leader>bl", ":lua require('telescope.builtin').buffers()<CR>", desc = "Bufferline: [b]uffer [l]ist" },
		{ "<Leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Bufferline: leave open this [b]ufffer [o]nly" },
		{ "<Leader>bd", "<Cmd>bd<CR>", desc = "Bufferline: [b]uffer [d]elete" },
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
