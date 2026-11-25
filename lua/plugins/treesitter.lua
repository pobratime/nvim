-- Treesitter: Neovim highlights; tree-sitter-manager installs the parsers
-- Neovim doesn't ship (needs: brew install tree-sitter-cli).
vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim" })

require("tree-sitter-manager").setup({
  ensure_installed = { "cpp", "cmake" }, -- C and Lua are built in
})

-- Treesitter highlighting for these (falls back to regex if a parser is missing)
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
  pattern = { "c", "cpp", "cmake", "lua" },
  callback = function(args) pcall(vim.treesitter.start, args.buf) end,
})
