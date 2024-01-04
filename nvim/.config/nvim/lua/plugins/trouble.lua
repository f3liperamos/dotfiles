return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		use_diagnostic_signs = true,
	},
	keys = {
		{
			"gr",
			function()
				require("trouble").toggle("lsp_references")
			end,
			desc = "Show LSP references [Trouble]",
		},
	},
}
