local on_attach = function(client)
  print("LSP started.");
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end

-- require'nvim_lsp'.tsserver.setup{on_attach = on_attach}
require'nvim_lsp'.rust_analyzer.setup{on_attach = on_attach}
require'nvim_lsp'.flow.setup{on_attach = on_attach}
