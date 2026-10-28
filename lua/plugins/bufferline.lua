return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        show_duplicate_prefix = false,
        name_formatter = function(buf)
          -- generic Next.js file names that need their folder to be understood
          local generic = {
            ["page.tsx"] = true,
            ["layout.tsx"] = true,
            ["loading.tsx"] = true,
            ["error.tsx"] = true,
            ["route.ts"] = true,
          }
          if generic[buf.name] then
            return vim.fn.fnamemodify(buf.path, ":h:t") .. "/" .. buf.name
          end
          return buf.name
        end,
      },
    },
  },
}
