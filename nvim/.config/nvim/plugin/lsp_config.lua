local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		async = true,
		filter = function(client)
			return client.name ~= "tsserver"
		end,
		bufnr = bufnr,
	})
end

local on_attach = function(client, bufnr)
	--[[ Format on save not sure if I like it
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
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
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	buf_set_keymap("n", "<leader>fmt", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
end

-- Enable auto signature help
require("lsp_signature").setup({
	debug = true,
	hint_enable = false,
	handler_opts = { border = "single" },
	max_width = 80,
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
local sources = {
	--null_ls.builtins.formatting.eslint_d,
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.formatting.stylua,
}
null_ls.setup({ sources = sources, on_attach = on_attach })

--[[
-- Disable ltex for now
lspconfig.ltex.setup({
	filetypes = { "bib", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "gitcommit" },
	on_attach = on_attach,
	capabilities = capabilities,
})
]]
