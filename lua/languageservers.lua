local languageservers = {}

function languageservers.setup (cap)
    require'lspconfig'.hls.setup{cap}
    require'lspconfig'.pyright.setup{cap}
    require'lspconfig'.clangd.setup{cap}
    require'lspconfig'.rust_analyzer.setup{cap}
    --require'lspconfig'.eslint.setup{cap}
    --require'lspconfig'.ts_ls.setup{cap}
    require'lspconfig'.denols.setup{cap}
    require'lspconfig'.terraform_lsp.setup{}
    require'lspconfig'.elmls.setup{cap}
    require'lspconfig'.cmake.setup{cap}
    require'lspconfig'.metals.setup{cap}
end

return languageservers
