-- CMake: configure, build and run from Neovim (cmake-tools.nvim).
-- Output in a floating terminal (toggleterm). Builds go to out/<build type>,
-- compile_commands.json is linked into the project root for clangd.
vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/akinsho/toggleterm.nvim",
  "https://github.com/Civitasv/cmake-tools.nvim",
})

require("toggleterm").setup()

local float = {
  name = "toggleterm",
  opts = { direction = "float", close_on_exit = false, auto_scroll = true, singleton = true },
}

require("cmake-tools").setup({
  cmake_executor = float, -- configure / build
  cmake_runner = float, -- run
})

local map = vim.keymap.set
map("n", "<leader>mg", "<cmd>CMakeGenerate<cr>", { desc = "Configure (generate)" })
map("n", "<leader>mb", "<cmd>CMakeBuild<cr>", { desc = "Build" })
map("n", "<leader>mr", "<cmd>CMakeRun<cr>", { desc = "Build & run" })
map("n", "<leader>mt", "<cmd>CMakeSelectLaunchTarget<cr>", { desc = "Pick target to run" })
