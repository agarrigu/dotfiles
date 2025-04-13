-- Setup treesitter
local languages = {
      "bash",
      "comment",
      "css",
      "dockerfile",
      "html",
      "lua",
      "java",
      "javascript",
      "json",
      "make",
      "markdown",
      "markdown_inline",
      "php",
      "python",
      "query",
      "regex",
      "rust",
      "scss",
      "sql",
      "toml",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
      }
require'nvim-treesitter.configs'.setup {
  ensure_installed = languages,
  highlight = {
    enable = languages,
    additional_vim_regex_highlighting = true,
  },
}
require'telescope'.load_extension('fzf')
