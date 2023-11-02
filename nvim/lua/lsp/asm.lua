local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").asm.setup({
    capabilities = capabilities,
    cmd = { "asm-lsp" },
    on_attach = on_attach,
  })
end
return M
