vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
    virtual_text= false,
  }
)

local completion = require'completion'.on_attach
require'lspconfig'.rust_analyzer.setup{on_attach = completion}
require'lspconfig'.tsserver.setup{on_attach = completion}
