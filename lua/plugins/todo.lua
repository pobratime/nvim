-- Highlight TODO/FIXME/HACK/NOTE... in comments. Space st lists them.
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim", -- needed by todo-comments
  "https://github.com/folke/todo-comments.nvim",
})

local todo = require("todo-comments")
todo.setup()

vim.keymap.set("n", "]t", function() todo.jump_next() end, { desc = "Next TODO" })
vim.keymap.set("n", "[t", function() todo.jump_prev() end, { desc = "Previous TODO" })
vim.keymap.set("n", "<leader>st", function() Snacks.picker.todo_comments() end, { desc = "TODOs" })
