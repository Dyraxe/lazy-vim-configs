-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.keymap.set("n", "<leader>p", function()
  local text = vim.fn.getreg("+"):gsub("[\r\n]+$", "")
  local lines = vim.split(text, "\r?\n")
  local last = vim.api.nvim_buf_line_count(0)
  local last_is_empty = vim.api.nvim_buf_get_lines(0, last - 1, last, false)[1] == ""
  vim.api.nvim_buf_set_lines(0, last_is_empty and last - 1 or last, last, false, lines)
  vim.cmd("normal! G")
end, { desc = "Append clipboard at end of file" })
