return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			javascript = { "eslint_d", { "prettierd", "prettier" } },
			typescript = { "eslint_d", { "prettierd", "prettier" } },
			typescriptreact = { "eslint_d", { "prettierd", "prettier" } },
			css = { { "prettierd", "prettier" } },
			sass = { { "prettierd", "prettier" } },
			less = { { "prettierd", "prettier" } },
			markdown = { { "prettierd", "prettier" } },
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
