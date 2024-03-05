return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "[g]oto [d]efinition")
				map("gr", require("telescope.builtin").lsp_references, "[g]oto [r]eferences")
				map("gI", require("telescope.builtin").lsp_implementations, "[g]oto [I]mplementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[d]ocument [s]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("[d", vim.diagnostic.goto_prev, "Go to previous [D]iagnostic message")
				map("]d", vim.diagnostic.goto_next, "Go to next [D]iagnostic message")
				map("<leader>e", vim.diagnostic.open_float, "Show diagnostic [E]rror messages")
				map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end

				if client.name == "tsserver" then
					client.server_capabilities.documentFormattingProvider = false
				end
			end,
		})

		vim.diagnostic.config({
			virtual_text = false,
			update_in_insert = false,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		require("mason").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"eslint_d",
				"prettier",
				"prettierd",
				"stylua",
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"cssls",
				"html",
				"jsonls",
				"lua_ls",
				"rust_analyzer",
				"tsserver",
			},
			handlers = {
				function(server_name)
					local server = {}
					local settings_ok, server_settings = pcall(require, "lsp.settings." .. server_name)
					if settings_ok then
						server = server_settings
					end

					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
