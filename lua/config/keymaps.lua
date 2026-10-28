-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- find the file path of the Markdown link under the cursor
vim.keymap.set("n", "<leader>io", function()
  local line = vim.api.nvim_get_current_line()
  local target = line:match("%((.-)%)") -- the text between ( and ) on this line
  if not target then
    return vim.notify("No link on this line", vim.log.levels.WARN)
  end
  -- turn %20 back into spaces, then resolve relative to the current note
  target = target:gsub("%%(%x%x)", function(h)
    return string.char(tonumber(h, 16))
  end)
  local path = vim.fn.fnamemodify(vim.fn.expand("%:p:h") .. "/" .. target, ":p")
  vim.ui.open(path)
end, { desc = "Open image link in default app" })

vim.keymap.set("n", "<leader>id", function()
  local line = vim.api.nvim_get_current_line()
  local target = line:match("%((.-)%)")
  if not target then
    return vim.notify("No link on this line", vim.log.levels.WARN)
  end
  target = target:gsub("%%(%x%x)", function(h)
    return string.char(tonumber(h, 16))
  end)
  local path = vim.fn.fnamemodify(vim.fn.expand("%:p:h") .. "/" .. target, ":p")
  if vim.fn.filereadable(path) == 0 then
    return vim.notify("File not found: " .. path, vim.log.levels.WARN)
  end
  if vim.fn.confirm("Delete this image and its link line?\n" .. path, "&Yes\n&No", 2) == 1 then
    vim.fn.delete(path)
    vim.cmd("normal! dd")
  end
end, { desc = "Delete image file and its link line" })

-- cut the first 6 lines of the file, wherever the cursor is
vim.keymap.set("n", "<leader>k", function()
  local count = math.min(6, vim.api.nvim_buf_line_count(0))
  vim.cmd(("1,%dd"):format(count))
end, { desc = "Cut first 6 lines of file" })
