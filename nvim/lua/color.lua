local colorscheme = "base16-monokai"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("There is no " .. colorscheme .. " color :_")
  return
end
