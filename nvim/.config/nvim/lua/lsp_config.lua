local on_attach = function(client)
  print("LSP started.");
  require'completion'.on_attach(client)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = false,
    virtual_text= false,
  }
)

local lspconfig = require'lspconfig';
lspconfig.rust_analyzer.setup{on_attach=on_attach}
lspconfig.tsserver.setup{on_attach=on_attach}
