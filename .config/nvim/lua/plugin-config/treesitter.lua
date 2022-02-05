-- Setup treesitter
local languages = {
      "bash",
      "comment",
      "css",
      "html",
      "lua",
      "java",
      "javascript",
      "json",
      "haskell",
      "markdown",
      "php",
      "python",
      "regex",
      "rust",
      "scss",
      "typescript",
      "vim",
      }
require'nvim-treesitter.configs'.setup {
  ensure_installed = languages,
  highlight = {
    enable = languages,
    additional_vim_regex_highlighting = true,
  },
}
require'telescope'.load_extension('fzf')
