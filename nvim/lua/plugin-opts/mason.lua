local mason        = require'mason'
local mason_lsp    = require'mason-lspconfig'
local lspconf      = require'lspconfig'
local capabilities = require'cmp_nvim_lsp'.default_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers      = {
  'bashls',
  'clangd',
  'marksman',
  'pylsp',
  -- 'rome',       -- js, ts, html, css :o
  -- 'rust_analyzer',
  'lua_ls',
  'vimls',
  -- 'asm_lsp',
}

mason.setup()
mason_lsp.setup({
  ensure_installed = servers
})

mason_lsp.setup_handlers({
  function(server)
    lspconf[server].setup {
      capabilities = capabilities,
      -- settings = {
        -- root_dir = function return vim.loop.cwd() end
      -- },
    }
  end,
  ['lua_ls'] = function ()
    lspconf.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
  end,
})
