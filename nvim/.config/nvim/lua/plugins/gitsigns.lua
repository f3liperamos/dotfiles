return {
	"lewis6991/gitsigns.nvim",
	dependencies = { "tpope/vim-fugitive" },
	version = "v0.7",
	opts = {
		current_line_blame = true,
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
}
