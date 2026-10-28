return {
  "saghen/blink.cmp",
  opts = {
    enabled = function()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local before = vim.api.nvim_get_current_line():sub(1, col)
      if before:match("%f[%w_]%d+$") then
        return false
      end
      return true
    end,

    sources = {
      min_keyword_length = 2,
      providers = {
        path = {
          enabled = function()
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local before = vim.api.nvim_get_current_line():sub(1, col)
            return not before:match("[\"']/[%w%._%-]*$")
          end,
        },
      },
    },
  },
}
