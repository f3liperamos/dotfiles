return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	---@module 'oil'
	---@type oil.SetupOpts
	opts = {},
	keys = {
		{
			"<Leader>E",
			"<cmd>Oil<cr>",
			mode = { "n" },
			desc = "Oil: open [e]xplorer",
		},
	},
}
