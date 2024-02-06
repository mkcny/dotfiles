require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "rust_analyzer",
    "pyright",
  },
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()

local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

  require("lsp-format").on_attach(client, bufnr)
end

require("lspconfig").rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
require("lspconfig").pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
