-- Neovim config, built from scratch on vim.pack (Neovim 0.12+).

-- Leader keys must be set before any mapping uses them
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("options")
require("keymaps")
require("autocmds")

-- Plugins: one file per plugin in lua/plugins/, all loaded here.
-- Colorscheme first, so the other plugins start with the right colors.
require("plugins.colorscheme")
for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/plugins")) do
  if file:match("%.lua$") then
    require("plugins." .. file:gsub("%.lua$", ""))
  end
end
