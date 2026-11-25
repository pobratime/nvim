-- noice: command line popup at the top (: and / ?); messages and LSP
-- progress small in the bottom-right. Notifications (vim.notify) are left
-- to snacks, which shows them as cards in the top-right.
vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim", -- needed by noice
  "https://github.com/folke/noice.nvim",
})

require("noice").setup({
  notify = { enabled = false },
  presets = {
    command_palette = true, -- popup at the top, suggestions under it
    long_message_to_split = true,
  },
  lsp = {
    override = { -- nicer markdown in hover/signature popups
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  routes = {
    { -- hide: "written" lines, undo/redo info, [3/12] search count
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
          { kind = "undo" },
          { kind = "search_count" },
        },
      },
      opts = { skip = true },
    },
  },
})
