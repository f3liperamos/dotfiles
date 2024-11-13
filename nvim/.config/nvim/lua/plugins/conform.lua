vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! disables formatting globally
		vim.g.disable_autoformat = true
	else
		vim.b.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

return {
	{
		"stevearc/conform.nvim",
		version = "5.*",
		opts = {
			format_on_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { notify_on_error = true, timeout_ms = 500, lsp_format = "fallback" }
			end,
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
				html = { { "prettierd", "prettier" } },
			},
		},
		keys = {
			{
				"<Leader>fmt",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = { "n", "x" },
				desc = "Conform: [f]or[m]a[t] buffer",
			},
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
}
