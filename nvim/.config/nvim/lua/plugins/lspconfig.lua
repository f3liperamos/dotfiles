return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"nvim-telescope/telescope.nvim",
		"saghen/blink.cmp",
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
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[w]orkspace [s]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[c]ode [a]ction")
				map("gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
				map("<leader>e", vim.diagnostic.open_float, "Show diagnostic [e]rror messages")
				map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [q]uickfix list")

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

				if client.name == "ts_ls" then
					client.server_capabilities.documentFormattingProvider = false
				end
			end,
		})

		vim.diagnostic.config({
			virtual_text = false,
			update_in_insert = false,
		})

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		local servers = {
			-- Linters / Formatters
			eslint_d = {},
			prettier = {},
			prettierd = {},
			stylua = {},

			-- LSPs
			cssls = {},
			html = {},
			jsonls = {},
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			},
			rust_analyzer = {},
			ts_ls = {},
		}

		require("mason").setup()
		require("mason-tool-installer").setup({ ensure_installed = vim.tbl_keys(servers) or {} })
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
