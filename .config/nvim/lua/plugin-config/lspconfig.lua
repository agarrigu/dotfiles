local nvim_lsp = require'lspconfig'
local capabilites = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
nvim_lsp['vimls'].setup { capabilites = capabilites }
nvim_lsp['bashls'].setup { capabilites = capabilites }
nvim_lsp['pyright'].setup { capabilites = capabilites }

-- TODO fix `vim` to global variable
nvim_lsp['sumneko_lua'].setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
