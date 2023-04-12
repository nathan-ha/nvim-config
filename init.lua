require "core"
require "plugin-loader"

local name = "catppuccin"

local theme_ok = pcall(vim.cmd.colorscheme, name)
if not theme_ok then
  vim.notify("The theme isn't installed or you had a typo", vim.log.levels.ERROR)
else
  require("plugins.theme." .. name)
end
