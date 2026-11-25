-- Buffer tabs at the top. Shift-h / Shift-l switch.
require("plugins.icons")
vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })

require("bufferline").setup({
  options = {
    always_show_bufferline = true,
    diagnostics = "nvim_lsp",
    offsets = { { filetype = "snacks_layout_box" } }, -- tabs start right of the explorer
    -- hide the empty [No Name] buffer (unless you type into it)
    custom_filter = function(buf)
      return vim.api.nvim_buf_get_name(buf) ~= "" or vim.bo[buf].modified
    end,
  },
})

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
