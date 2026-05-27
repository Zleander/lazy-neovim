return {
  {
    "knubie/vim-kitty-navigator",
    init = function()
      vim.g.kitty_navigator_enable_stack_layout = 1
    end,
    build = {
      "cp ./*.py ~/.config/kitty/",
    },
    keys = {
      { "<C-j>", "<cmd>KittyNavigateDown<cr>" },
      { "<C-h>", "<cmd>KittyNavigateLeft<cr>" },
      { "<C-l>", "<cmd>KittyNavigateRight<cr>" },
      { "<C-k>", "<cmd>KittyNavigateUp<cr>" },
    },
  },
}
