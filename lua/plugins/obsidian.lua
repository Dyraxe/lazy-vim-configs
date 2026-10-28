return {
  "obsidian-nvim/obsidian.nvim",
  ft = "markdown",
  opts = {
    legacy_commands = false,
    workspaces = { { name = "notes", path = "C:/Users/maytsit/notes" } },
    ui = { enable = false }, -- avoids clashing with render-markdown
    daily_notes = {
      folder = "journal",
      date_format = "%Y/%m/%Y-%m-%d",
    },
    new_notes_location = "notes_subdir",
    note_id_func = function(title)
      if title ~= nil then
        return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      end
      return tostring(os.time())
    end,
    link = {
      style = function(opts)
        local header_or_block = ""
        if opts.anchor then
          header_or_block = string.format("#%s", opts.anchor.header)
        elseif opts.block then
          header_or_block = string.format("#%s", opts.block.id)
        end
        return string.format("[[%s%s]]", opts.label, header_or_block)
      end,
    },
  },
  keys = {
    { "<leader>oo", "<cmd>Obsidian<cr>", desc = "Obsidian commands" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Backlinks" },
    { "<leader>of", "<cmd>Obsidian quick_switch<cr>", desc = "Find note" },
    { "<leader>od", "<cmd>Obsidian today<cr>", desc = "Daily note" },
    { "<leader>ot", "<cmd>Obsidian tags<cr>", desc = "Search tags" },
    { "<leader>og", "<cmd>Obsidian follow_link<cr>", desc = "Follow link" },
  },
}
