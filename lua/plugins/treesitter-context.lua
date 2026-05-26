return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "VeryLazy",
  opts = {
    max_lines = 4,
    min_window_height = 20,
    line_numbers = true,
    multiline_threshold = 5,
    trim_scope = "outer",
    mode = "cursor",
    separator = "─",
  },
  keys = {
    {
      "<leader>uC",
      function()
        require("treesitter-context").toggle()
      end,
      desc = "Toggle Treesitter Context",
    },
  },
}
