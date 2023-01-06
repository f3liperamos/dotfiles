return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"graphql",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"jsonc",
				"latex",
				"lua",
				"rust",
				"tsx",
				"typescript",
			},
			sync_install = false,
			highlight = { enable = true },
		})
	end,
}
