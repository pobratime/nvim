-- Project search & replace (Space sr). In it: \r replaces all. Uses ripgrep.
vim.pack.add({ "https://github.com/MagicDuck/grug-far.nvim" })

local grug = require("grug-far")
grug.setup()

vim.keymap.set("n", "<leader>sr", function() grug.open() end, { desc = "Search & replace" })
