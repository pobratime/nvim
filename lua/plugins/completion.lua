-- Completion: blink.cmp + friendly-snippets.
-- Pinned to 1.x so blink downloads its prebuilt fuzzy matcher.
-- Enter accepts, Ctrl-Space opens, Ctrl-e closes, Tab jumps in snippets.
vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  "https://github.com/rafamadriz/friendly-snippets",
})

local blink = require("blink.cmp")
blink.setup({
  keymap = { preset = "enter" },
  completion = { documentation = { auto_show = true, auto_show_delay_ms = 200 } },

  -- Suggestions while typing a : command (like LazyVim). Tab / Ctrl-n pick,
  -- Enter runs. Not for / search, where a menu would just get in the way.
  cmdline = {
    keymap = { preset = "cmdline", ["<Right>"] = false, ["<Left>"] = false },
    completion = {
      menu = { auto_show = function() return vim.fn.getcmdtype() == ":" end },
      list = { selection = { preselect = false } },
      ghost_text = { enabled = true },
    },
  },
})

-- Tell the language servers what blink supports (loads before lsp.lua)
vim.lsp.config("*", { capabilities = blink.get_lsp_capabilities() })
