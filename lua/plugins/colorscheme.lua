vim.pack.add({
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/tpope/vim-vividchalk",
  "https://github.com/morhetz/gruvbox",
  "https://github.com/mhartington/oceanic-next",
  "https://github.com/NLKNguyen/papercolor-theme",
  "https://github.com/Shatur/neovim-ayu",
  "https://github.com/scottmckendry/cyberdream.nvim",
})

require("tokyonight").setup({ style = "moon" })

local file = vim.fn.stdpath("data") .. "/colorscheme"

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("remember_colorscheme", { clear = true }),
  callback = function(args) vim.fn.writefile({ args.match }, file) end,
})

local saved = vim.fn.filereadable(file) == 1 and vim.fn.readfile(file)[1]
if not pcall(vim.cmd.colorscheme, saved or "tokyonight") then
  vim.cmd.colorscheme("tokyonight")
end

vim.keymap.set("n", "<leader>uc", function() Snacks.picker.colorschemes() end, { desc = "Colorscheme" })
