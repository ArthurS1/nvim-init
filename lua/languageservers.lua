local languageservers = {}

function languageservers.setup (cap)
  vim.lsp.config('*', cap)
  vim.lsp.enable('rust_analyzer')
  vim.lsp.enable('hls')
  vim.lsp.enable('pyright')
  -- vim.lsp.enable('eslint')
  -- vim.lsp.enable('ts_ls')
  vim.lsp.enable('cssls')
  vim.lsp.enable('denols')
  vim.lsp.enable('terraform_lsp')
  vim.lsp.enable('elmls')
  vim.lsp.enable('metals')
end

return languageservers
