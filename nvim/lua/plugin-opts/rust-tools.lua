local rt = require("rust-tools")
local rtdap = require("rust-tools.dap")

local extension_path  = vim.env.HOME    .. '/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path   = extension_path  .. 'adapter/codelldb'
local liblldb_path    = extension_path  .. 'lldb/lib/liblldb.so'

rt.setup({
  dap = {
    adapter = rtdap.get_codelldb_adapter(codelldb_path, liblldb_path),
  },
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
