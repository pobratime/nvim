-- Delete the empty [No Name] buffer once a real file is open
-- (only if it's unnamed, unchanged, empty and not in a window).
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("delete_no_name", { clear = true }),
  callback = function(args)
    if vim.api.nvim_buf_get_name(args.buf) == "" or vim.bo[args.buf].buftype ~= "" then
      return
    end
    vim.schedule(function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local empty = vim.api.nvim_buf_is_valid(buf)
          and vim.bo[buf].buflisted
          and vim.bo[buf].buftype == ""
          and vim.api.nvim_buf_get_name(buf) == ""
          and not vim.bo[buf].modified
          and vim.api.nvim_buf_line_count(buf) == 1
          and vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] == ""
        if empty and vim.fn.bufwinid(buf) == -1 then
          pcall(vim.api.nvim_buf_delete, buf, {})
        end
      end
    end)
  end,
})
