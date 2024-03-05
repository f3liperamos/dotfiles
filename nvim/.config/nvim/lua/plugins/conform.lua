return {
	"stevearc/conform.nvim",
	version = "5.*",
	opts = {
		format_on_save = {
			notify_on_error = true,
			timeout_ms = 500,
			lsp_fallback = true,
		},
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
			desc = "Conform: [f]or[m]a[t] buffer",
		},
	},
}
