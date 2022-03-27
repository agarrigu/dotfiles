local lsp_installer = require'nvim-lsp-installer'
local servers = {
  'bashls',
  'vimls',
  'pyright',
  'sumneko_lua',
  -- 'rome',
  'rust_analyzer',
  'html',
  'cssls',
  'lemminx',
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
  opts.settings = {
    root_dir = function() return vim.loop.cwd() end
  }
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
