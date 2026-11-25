-- which-key: popup showing what the next key does.
vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup({
  preset = "helix",
  delay = 0,
  spec = {
    { "<leader>b", group = "buffer" },
    { "<leader>c", group = "code" },
    { "<leader>f", group = "find" },
    { "<leader>g", group = "git" },
    { "<leader>gh", group = "hunks" },
    { "<leader>q", group = "quit" },
    { "<leader>s", group = "search" },
    { "<leader>u", group = "ui" },
    { "<leader>x", group = "diagnostics" },
    { "g", group = "goto" },
    { "gr", group = "lsp" },
    { "z", group = "fold" },
    { "[", group = "prev" },
    { "]", group = "next" },
  },
})
