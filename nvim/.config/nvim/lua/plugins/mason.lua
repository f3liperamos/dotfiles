return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"eslint_d",
				"prettier",
				"prettierd",
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
