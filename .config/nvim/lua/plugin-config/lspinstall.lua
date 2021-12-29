local lsp_installer = require'nvim-lsp-installer'
local servers = {
  'bashls',
  'vimls',
  'dotls',
  'cssls',
  'emmet_ls',
  'pyright',
  'sumneko_lua',
  'sqlls',
--  'jdtls',
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

lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)
