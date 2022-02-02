local lsp_installer = require'nvim-lsp-installer'
local servers = {
  'bashls',
  'vimls',
  'pyright',
  'sumneko_lua',
  'rust_analyzer',
  'javascript',
  'typescript',
  'html',
  'css',
}

for _, name in pairs(servers) do
  local ok, server = lsp_installer.get_server(name)
  if ok then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

local capabilites = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp_installer.on_server_ready(function(server)
  local opts = {}
  opts.capabilites = capabilites
  if server.name == 'sumneko_lua' then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  end
  server:setup(opts)
end)
