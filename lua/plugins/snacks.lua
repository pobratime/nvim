-- snacks.nvim: picker, explorer, lazygit, buffer delete, and LazyVim's
-- look: smooth scrolling, indent guides, notifications, word highlight.
vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
  picker = {
    enabled = true, -- also used for choice lists (code actions etc.)
    sources = { explorer = { ignored = true } }, -- show gitignored files (I toggles)
  },
  explorer = { enabled = true }, -- also opens on `nvim .`
  scroll = { enabled = true }, -- smooth scrolling
  indent = { enabled = true }, -- indent guides, animated current scope
  notifier = { enabled = true }, -- notifications slide in at the top-right
  words = { enabled = true }, -- highlight other uses of the word under cursor
})

local map = vim.keymap.set
local pick = Snacks.picker

-- Find
map("n", "<leader><space>", function() pick.files() end, { desc = "Find files" })
map("n", "<leader>fb", function() pick.buffers() end, { desc = "Open buffers" })
map("n", "<leader>fr", function() pick.recent() end, { desc = "Recent files" })
map("n", "<leader>fc", function() pick.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find config file" })

-- Search
map("n", "<leader>/", function() pick.grep() end, { desc = "Grep in project" })
map({ "n", "x" }, "<leader>sw", function() pick.grep_word() end, { desc = "Grep word under cursor" })
map("n", "<leader>sd", function() pick.diagnostics_buffer() end, { desc = "Diagnostics (this file)" })
map("n", "<leader>sD", function() pick.diagnostics() end, { desc = "Diagnostics (project)" })
map("n", "<leader>ss", function() pick.lsp_symbols() end, { desc = "Symbols (this file)" })
map("n", "<leader>sS", function() pick.lsp_workspace_symbols() end, { desc = "Symbols (project)" })
map("n", "<leader>sh", function() pick.help() end, { desc = "Search help" })
map("n", "<leader>sk", function() pick.keymaps() end, { desc = "Search keymaps" })
map("n", "<leader>:", function() pick.command_history() end, { desc = "Command history" })

-- Explorer (inside: a add, d delete, r rename, H hidden, I ignored, ? help)
map("n", "<leader>e", function() Snacks.explorer() end, { desc = "File explorer" })

-- Git (lazygit: brew install lazygit)
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
map("n", "<leader>gl", function() Snacks.lazygit.log() end, { desc = "Git log (project)" })
map("n", "<leader>gf", function() Snacks.lazygit.log_file() end, { desc = "Git log (this file)" })

-- Close buffer, keep the window
map("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Close buffer" })
