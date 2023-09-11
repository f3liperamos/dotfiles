return {
	"lewis6991/gitsigns.nvim",
	dependencies = { "tpope/vim-fugitive" },
	version = "v0.6",
	config = function()
		require("gitsigns").setup({
			current_line_blame = true,
			trouble = true,
		})
	end,
}
