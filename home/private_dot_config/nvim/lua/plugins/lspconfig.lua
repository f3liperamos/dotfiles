return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				local picker = require("fzf-lua")

				map("gd", picker.lsp_definitions, "[g]oto [d]efinition")
				map("gD", picker.lsp_declarations, "[g]oto [D]eclaration")
				map("gr", picker.lsp_references, "[g]oto [r]eferences")
				map("gI", picker.lsp_implementations, "[g]oto [I]mplementation")
				map("<leader>gF", picker.lsp_finder, "[g]oto [F]inder")
				map("<leader>D", picker.lsp_typedefs, "Type [D]efinition")
				map("<leader>ca", picker.lsp_code_actions, "[c]ode [a]ction")
				map("<leader>ds", picker.lsp_document_symbols, "[d]ocument [s]ymbols")
				map("<leader>ws", picker.lsp_workspace_symbols, "[w]orkspace [s]ymbols")
				map("<leader>rn", vim.lsp.buf.rename, "[r]e[n]ame")
				map("<leader>e", vim.diagnostic.open_float, "Show diagnostic [e]rror messages")
				map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [q]uickfix list")

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					-- Why inside the client.supports_mthod condition: https://github.com/nvim-lua/kickstart.nvim/pull/900
					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end
			end,
		})

		vim.diagnostic.config({
			virtual_text = false,
			update_in_insert = false,
			float = {
				border = "solid",
			},
		})

		local servers = {
			-- Linters / Formatters
			eslint = {},
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
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			},
			rust_analyzer = {},
			ts_ls = {},
		}

		require("mason-tool-installer").setup({ ensure_installed = vim.tbl_keys(servers or {}) })
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
				require("lspconfig")[server_name].setup(server)
			end,
		})
	end,
}
