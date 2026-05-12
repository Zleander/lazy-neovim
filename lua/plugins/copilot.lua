return {
  -- {
  --   "blink-cmp-copilot",
  --   enabled = false,
  -- },
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = {},
    opts = {
      sources = {
        providers = {
          -- disable copilot
          copilot = {
            enabled = false,
            score_offset = -1000,
          },
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        copilot_suggestion_hidden = false,

        keymap = {
          -- accept with Shift + Right
          accept = "<S-Right>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    model = "claude-3.7-sonnet-thought",
  },
}
