return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    default = {
      dir_path = "assets", -- images are saved in an "assets" folder
      relative_to_current_file = true, -- next to the note you're editing
      prompt_for_file_name = false, -- don't ask for a name each time
      file_name = "Pasted image %Y%m%d%H%M%S",
    },
  },
  keys = {
    { "<leader>ip", "<cmd>PasteImage<cr>", desc = "Paste image from clipboard" },
  },
}
