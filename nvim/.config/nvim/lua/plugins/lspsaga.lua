return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	-- Way too many icons around, need to disable icon or at least customize them to make them not so ugly
	config = function()
		require("lspsaga").setup({
			ui = {
				kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
			breadcrumbs = { enable = false }, -- kind of useful but needs some work/research
			lightbulb = { enable = false }, -- adds too much noise
			-- beacon = { enable = false }, -- 
			codeaction = { extend_gitsigns = true },
		})
	end,
}
