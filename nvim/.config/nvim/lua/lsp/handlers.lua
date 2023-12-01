---@param keymaps table<string, function> wrap the identifiers in brackets i.e.: ["string"] = value
---@param opts table same as vim.keymap.set() opts
local function keymap_set(keymaps, opts)
	opts = opts or { noremap = true, silent = true }
	for keymap, action in pairs(keymaps) do
		vim.keymap.set("n", keymap, action, opts)
	end
end

local function lsp_highlight_document(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_highlight_document", { clear = true })
		vim.api.nvim_create_autocmd("CursorHold", {
			group = "lsp_highlight_document",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_highlight_document",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})

		-- make CursorHold trigger after 1 second
		vim.opt.updatetime = 1000
	end
end

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
})

local M = {}
M.capabitilies = require("cmp_nvim_lsp").default_capabilities()
M.on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap_set({
		["<C-s>"] = vim.lsp.buf.signature_help,
		["<Leader>ca"] = vim.lsp.buf.code_action,
		["<Leader>rn"] = vim.lsp.buf.rename,
		["K"] = vim.lsp.buf.hover,
		["gd"] = vim.lsp.buf.definition,
		["gi"] = vim.lsp.buf.implementation,
		["gr"] = vim.lsp.buf.references,
		["[d"] = vim.diagnostic.goto_prev,
		["]d"] = vim.diagnostic.goto_next,
	}, bufopts)

	lsp_highlight_document(client, bufnr)

	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
end

return M
