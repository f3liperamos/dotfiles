return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"bash",
				"css",
				"diff",
				"dockerfile",
				"git_rebase",
				"gitcommit",
				"graphql",
				"javascript",
				"jsdoc",
				"json",
				"json5",
				"jsonc",
				"latex",
				"lua",
				"markdown",
				"markdown_inline",
				"rust",
				"tsx",
				"typescript",
			})

			-- https://github.com/nvim-treesitter/nvim-treesitter/issues/5297
			---@diagnostic disable-next-line: missing-fields
			-- require("nvim-treesitter.configs").setup({
			-- 	incremental_selection = {
			-- 		enable = true,
			-- 		keymaps = {
			-- 			init_selection = "<C-Space>",
			-- 			node_incremental = "<C-Space>",
			-- 			scope_incremental = false,
			-- 			node_decremental = "<Backspace>",
			-- 		},
			-- 	},
			-- })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = { multiline_threshold = 1 },
	},
}
