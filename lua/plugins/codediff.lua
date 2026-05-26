return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", false },
      { "<leader>gD", false },
    },
  },
  {
    "ibhagwan/fzf-lua",
    keys = {
      { "<leader>gd", false },
    },
  },
  {
    "esmuellert/codediff.nvim",
    version = "v2.45.0",
    cmd = "CodeDiff",
    opts = {
      diff = {
        layout = "side-by-side",
        ignore_trim_whitespace = false,
        jump_to_first_change = true,
      },
    },
  },
}
