local on_attach = function(_, bufnr)
	--[[ Disabling omnifunc, it's cmp_nvim_lsp job now
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	]]

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- Mappings
	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap(
		"n",
		"<C-k>",
		"<cmd>lua vim.lsp.buf.signature_help()<CR>",
		opts
	)
	buf_set_keymap(
		"n",
		"<leader>D",
		"<cmd>lua vim.lsp.buf.type_definition()<CR>",
		opts
	)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap(
		"n",
		"<leader>ca",
		"<cmd>lua vim.lsp.buf.code_action()<CR>",
		opts
	)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap(
		"n",
		"<leader>e",
		"<cmd>lua vim.diagnostic.open_float()<CR>",
		opts
	)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap(
		"n",
		"<leader>q",
		"<cmd>lua vim.diagnostic.setloclist()<CR>",
		opts
	)
	buf_set_keymap(
		"n",
		"<leader>fmt",
		"<cmd>lua vim.lsp.buf.formatting()<CR>",
		opts
	)
end

-- Enable auto signature help
require("lsp_signature").setup({
	debug = true,
	hint_enable = false,
	handler_opts = { border = "single" },
	max_width = 80,
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local servers = { "rust_analyzer", "tsserver" }
local lspconfig = require("lspconfig")
for _, lsp_server in ipairs(servers) do
	lspconfig[lsp_server].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
	},
})

--[[
-- Disable ltex for now
lspconfig.ltex.setup({
	filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "gitcommit" },
	on_attach = on_attach,
	capabilities = capabilities,
})
]]
