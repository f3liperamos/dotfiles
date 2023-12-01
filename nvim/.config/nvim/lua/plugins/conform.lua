return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			javascript = { { "eslint_d", "prettierd" } },
			typescript = { { "eslint_d", "prettierd" } },
			typescriptreact = { { "eslint_d", "prettierd" } },
			css = { "prettierd" },
			sass = { "prettierd" },
			less = { "prettierd" },
		},
	},
	keys = {
		{
			"<Leader>fmt",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "x" },
			desc = "Format buffer [Conform]",
		},
	},
}
