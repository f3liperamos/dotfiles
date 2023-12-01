return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"prettierd",
				"eslint_d",
				"stylua",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		config = function()
			local servers = {
				"cssls",
				"html",
				"jsonls",
				"lua_ls",
				"rust_analyzer",
				"tsserver",
			}

			require("mason-lspconfig").setup({ ensure_installed = servers })

			local handlers = require("lsp.handlers")
			for _, server in ipairs(servers) do
				local settings = {
					capabitilies = handlers.capabitilies,
					on_attach = handlers.on_attach,
				}

				local settings_ok, server_settings = pcall(require, "lsp.settings." .. server)
				if settings_ok then
					settings = vim.tbl_deep_extend("force", server_settings, settings)
				end

				require("lspconfig")[server].setup(settings)
			end
		end,
	},
}
