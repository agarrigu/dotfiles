local nvim_lsp = require'lspconfig'
local capabilites = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
nvim_lsp['vimls'].setup { capabilites = capabilites }
nvim_lsp['bashls'].setup { capabilites = capabilites }
nvim_lsp['dotls'].setup { capabilites = capabilites }
nvim_lsp['cssls'].setup { capabilites = capabilites }
--nvim_lsp['jdtls'].setup { capabilites = capabilites }
nvim_lsp['pyright'].setup { capabilites = capabilites }
nvim_lsp['emmet_ls'].setup { capabilites = capabilites }
nvim_lsp['sqlls'].setup { capabilites = capabilites }
-- nvim_lsp['sumneko_lua'].setup {capabilites = capabilites }
-- TODO fix `vim` to global variable
--nvim_lsp.sumneko_lua.setup {
--    settings = {
--        Lua = {
--            diagnostics = {
--                globals = { 'vim' }
--            }
--        }
--    }
--}
