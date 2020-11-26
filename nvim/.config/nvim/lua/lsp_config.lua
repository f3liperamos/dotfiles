local on_attach = function(client)
  print("LSP started.");
  require'completion'.on_attach(client)
end

local lspconfig = require'lspconfig'

require'lspconfig'.tsserver.setup{on_attach = on_attach}
require'lspconfig'.rust_analyzer.setup{on_attach = on_attach}
-- require'lspconfig'.flow.setup{on_attach = on_attach}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
    virtual_text= false,
  }
)
