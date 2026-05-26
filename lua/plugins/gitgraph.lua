return {
  "isakbm/gitgraph.nvim",
  commit = "c16daa7d7dd5",
  cmd = "GitGraph",
  keys = {
    {
      "<leader>gt",
      function()
        require("gitgraph").draw({}, { all = true, max_count = 5000 })
      end,
      desc = "Git graph (tree)",
    },
    {
      "<leader>gT",
      function()
        require("gitgraph").draw({}, { all = false, max_count = 5000 })
      end,
      desc = "Git graph (current branch only)",
    },
  },
  opts = {
    symbols = {
      merge_commit = "M",
      commit = "*",
      merge_commit_end = "M",
      commit_end = "*",
      GVER = "│",
      GHOR = "─",
      GCLD = "╮",
      GCRD = "╭",
      GCLU = "╯",
      GCRU = "╰",
      GLRU = "┴",
      GLRD = "┬",
      GLUD = "┤",
      GRUD = "├",
      GFORKU = "┼",
      GFORKD = "┼",
      GRUDCD = "├",
      GRUDCU = "├",
      GLUDCD = "┤",
      GLUDCU = "┤",
      GLRDCL = "┬",
      GLRDCR = "┬",
      GLRUCL = "┴",
      GLRUCR = "┴",
    },
    format = {
      timestamp = "%H:%M:%S %d-%m-%Y",
      fields = { "hash", "timestamp", "author", "branch_name", "tag" },
    },
    hooks = {
      on_select_commit = function(commit)
        vim.schedule(function()
          vim.cmd("CodeDiff " .. commit.hash .. "~ " .. commit.hash)
        end)
      end,
      on_select_range_commit = function(from, to)
        vim.schedule(function()
          vim.cmd("CodeDiff " .. from.hash .. " " .. to.hash)
        end)
      end,
    },
  },
}
