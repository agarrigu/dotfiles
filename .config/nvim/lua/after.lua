-- Colours
vim.opt.background = 'dark'
vim.highlight.on_yank({timeout=240})
vim.cmd.colorscheme("habamax")
vim.api.nvim_set_hl(0, "Normal", {ctermbg = "none"})
vim.api.nvim_set_hl(0, "Whitespace", {ctermbg = "none"})
vim.api.nvim_set_hl(0, "SignColumn", {ctermbg = "none"})
