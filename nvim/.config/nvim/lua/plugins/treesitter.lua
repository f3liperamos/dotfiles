return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			--- https://github.com/nvim-treesitter/nvim-treesitter/issues/5297
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				additional_vim_regex_highlighting = false,
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
					"markdown",
					"markdown_inline",
					"rust",
					"tsx",
					"typescript",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-Space>",
						node_incremental = "<C-Space>",
						scope_incremental = false,
						node_decremental = "<Backspace>",
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		dependencies = "nvim-treesitter/nvim-treesitter",
		opts = { multiline_threshold = 3 },
	},
}
