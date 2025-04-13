local indent = require'indent_blankline'

indent.setup {
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = false,
  filetype = {
    'html',
    'js',
    'json',
  },
}
