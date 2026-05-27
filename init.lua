-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.exrc = true

local worktrees_root = vim.fn.expand("~/Documents/Work/automedic/automedic-worktrees")
local cwd = vim.fn.getcwd()
if cwd:sub(1, #worktrees_root) == worktrees_root then
  local project_config = cwd .. "/.nvim.lua"
  if vim.fn.filereadable(project_config) == 1 then
    pcall(vim.secure.trust, { action = "allow", path = project_config })
  end
end

-- set language to en_US.UTF-8
