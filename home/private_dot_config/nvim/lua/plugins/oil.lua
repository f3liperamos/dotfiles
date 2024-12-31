return {
	"stevearc/oil.nvim",
	version = "*",
	lazy = false,

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
