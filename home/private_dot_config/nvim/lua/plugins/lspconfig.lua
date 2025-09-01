return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					local picker = require("fzf-lua")

					-- Prefix all lsp functions with `gr`, to make it closer or same to the defaults
					map("grd", picker.lsp_definitions, "goto [d]efinition")
					map("grD", picker.lsp_declarations, "goto [D]eclaration")
					map("grr", picker.lsp_references, "goto [r]eferences")
					map("gri", picker.lsp_implementations, "goto [i]mplementation")
					map("grF", picker.lsp_finder, "open [F]inder")
					map("grt", picker.lsp_typedefs, "goto [t]ype definition")
					map("grs", picker.lsp_document_symbols, "open document [s]ymbols")
					map("gra", picker.lsp_code_actions, "code [a]ction")
					map("grn", vim.lsp.buf.rename, "[r]e[n]ame")
					map("grq", vim.diagnostic.setloclist, "open diagnostics in [q]uickfix list")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if
						client
						and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
					then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
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

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})

						-- vim.treesitter.start()
					end
				end,
			})

			vim.diagnostic.config({
				virtual_text = false,
				update_in_insert = false,
			})

			local servers = {
				-- Linters / Formatters
				biome = {},
				eslint = {},
				eslint_d = {},
				prettier = {},
				prettierd = {},
				stylelint = {},
				stylua = {},

				-- LSPs
				bashls = {},
				cssls = {},
				harper_ls = {},
				html = {},
				jsonls = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = {
								checkThirdParty = false,
								library = vim.api.nvim_get_runtime_file("", true),
							},
							telemetry = { enable = false },
						},
					},
				},
				rust_analyzer = {},
				vtsls = {},
			}

			local ensure_installed = vim.tbl_keys(servers or {})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			---@type MasonLspconfigSettings
			---@diagnostic disable-next-line: missing-fields
			require("mason-lspconfig").setup({ automatic_enable = ensure_installed })
			for server_name, config in pairs(servers) do
				vim.lsp.config(server_name, config)
			end
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				bash = { "bash" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		version = "9.*",
		opts = {
			format_on_save = false,
			formatters_by_ft = {
				css = { "eslint_d", "prettierd", stop_after_first = true },
				html = { "prettierd" },
				javascript = { "eslint_d", "prettierd", stop_after_first = true },
				less = { "stylelint" },
				lua = { "stylua" },
				markdown = { "prettierd" },
				rust = { "rustfmt" },
				sass = { "stylelint" },
				typescript = { "eslint_d", "prettierd", stop_after_first = true },
				typescriptreact = { "eslint_d", "prettierd", stop_after_first = true },
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
}
