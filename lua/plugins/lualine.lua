-- Status bar: lualine, LazyVim's layout with slanted separators.
require("plugins.icons")
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

require("lualine").setup({
  options = {
    globalstatus = true, -- one bar for all splits
    section_separators = { left = "\u{e0bc}", right = "\u{e0ba}" },
    component_separators = { left = "\u{e0bd}", right = "\u{e0bb}" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      "diagnostics",
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { "filename", path = 1 },
    },
    lualine_x = { "diff" },
    lualine_y = { "progress", "location" },
    lualine_z = { function() return " " .. os.date("%R") end },
  },
})
