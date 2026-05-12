return {

  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    config = function()
      require("venv-selector").setup({
        settings = {
          options = {
            debug = true,
          },
          search = {
            anaconda_base = {
              command = "fd /python$ /opt/homebrew/Caskroom/miniconda/base/envs --full-path --color never -E /proc",
              type = "anaconda",
            },
          },
        },
      })
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
    -- opts = {
    --   anaconda_envs_path = "/opt/homebrew/Caskroom/miniconda/base/envs",
    --   debug = true,
    -- },
  },
}
