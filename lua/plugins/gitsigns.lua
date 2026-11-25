-- Git signs in the gutter, blame on the current line, hunk actions.
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

local gs = require("gitsigns")
local bar = { text = "▎" }
local signs = {
  add = bar,
  change = bar,
  changedelete = bar,
  untracked = bar,
  delete = { text = "" },
  topdelete = { text = "" },
}

gs.setup({
  signs = signs,
  signs_staged = signs,
  current_line_blame = true,
  current_line_blame_opts = { delay = 300 },
})

local map = vim.keymap.set
local function selection()
  local a, b = vim.fn.line("."), vim.fn.line("v")
  return { math.min(a, b), math.max(a, b) }
end

map("n", "]h", function() gs.nav_hunk("next") end, { desc = "Next hunk" })
map("n", "[h", function() gs.nav_hunk("prev") end, { desc = "Previous hunk" })
map("n", "<leader>ghs", gs.stage_hunk, { desc = "Stage hunk" })
map("n", "<leader>ghr", gs.reset_hunk, { desc = "Reset hunk" })
map("x", "<leader>ghs", function() gs.stage_hunk(selection()) end, { desc = "Stage selection" })
map("x", "<leader>ghr", function() gs.reset_hunk(selection()) end, { desc = "Reset selection" })
map("n", "<leader>ghS", gs.stage_buffer, { desc = "Stage file" })
map("n", "<leader>ghR", gs.reset_buffer, { desc = "Reset file" })
map("n", "<leader>ghp", gs.preview_hunk_inline, { desc = "Preview hunk" })
map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
map("n", "<leader>uB", function()
  vim.notify("Line blame " .. (gs.toggle_current_line_blame() and "on" or "off"))
end, { desc = "Toggle line blame" })
