-- LSP: Neovim's built-in client.
--   mason            downloads the servers (:Mason)
--   mason-lspconfig  installs the ones listed below
--   nvim-lspconfig   ready-made configs for each server
-- Neovim's default keys also work: K hover, grn rename, gra action,
-- grr references, gri implementation, gO symbols, [d ]d diagnostics.
vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

local servers = { "clangd", "neocmake", "lua_ls" } -- C/C++, CMake, Lua

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = servers, automatic_enable = false })

-- Lua: know about Neovim's API, so `vim` isn't an unknown global
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
    },
  },
})

-- CMake: neocmakelsp's formatter is off by default
vim.lsp.config("neocmake", { init_options = { format = { enable = true } } })

vim.lsp.enable(servers)

-- Errors/warnings as text at the end of the line
vim.diagnostic.config({ virtual_text = true, severity_sort = true })

-- Format on save through the server (clangd uses .clang-format, else LLVM)
vim.g.autoformat = true
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or not client:supports_method("textDocument/formatting", args.buf) then
      return
    end
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("lsp_format_buf_" .. args.buf, { clear = true }),
      buffer = args.buf,
      callback = function()
        if vim.g.autoformat then
          vim.lsp.buf.format({ bufnr = args.buf, timeout_ms = 1000 })
        end
      end,
    })
  end,
})

local map = vim.keymap.set

-- C/C++: Space ch switches between source and header (.cpp <-> .hpp)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("clangd_keys", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or client.name ~= "clangd" then
      return
    end
    map("n", "<leader>ch", function()
      local params = vim.lsp.util.make_text_document_params(args.buf)
      client:request("textDocument/switchSourceHeader", params, function(_, uri)
        if uri then
          vim.cmd.edit(vim.uri_to_fname(uri))
        else
          vim.notify("No matching source/header file found")
        end
      end, args.buf)
    end, { buffer = args.buf, desc = "Switch source/header" })
  end,
})

-- Code (Space c)
map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>cA", function()
  vim.lsp.buf.code_action({ context = { only = { "source" }, diagnostics = {} } })
end, { desc = "Source action" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map({ "n", "x" }, "<leader>cf", function() vim.lsp.buf.format({ timeout_ms = 1000 }) end, { desc = "Format" })

-- Toggles (Space u)
map("n", "<leader>uf", function()
  vim.g.autoformat = not vim.g.autoformat
  vim.notify("Format on save " .. (vim.g.autoformat and "on" or "off"))
end, { desc = "Toggle format on save" })
map("n", "<leader>ud", function()
  local on = not vim.diagnostic.is_enabled()
  vim.diagnostic.enable(on)
  vim.notify("Diagnostics " .. (on and "on" or "off"))
end, { desc = "Toggle diagnostics" })
map("n", "<leader>uh", function()
  local on = not vim.lsp.inlay_hint.is_enabled()
  vim.lsp.inlay_hint.enable(on)
  vim.notify("Inlay hints " .. (on and "on" or "off"))
end, { desc = "Toggle inlay hints" })
