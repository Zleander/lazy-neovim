-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Function to execute Python code

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "i", "v", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Flutter keymaps
vim.keymap.set("n", "<leader>pp", ":FlutterRestart<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pr", ":FlutterRun<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pq", ":FlutterQuit<CR>", { noremap = true, silent = true })

local function repo_relative_path()
  local abs = vim.fn.expand("%:p")
  if abs == "" then
    return vim.fn.expand("%")
  end
  local root = vim.fn.systemlist({ "git", "-C", vim.fn.expand("%:p:h"), "rev-parse", "--show-toplevel" })[1]
  if vim.v.shell_error == 0 and root and root ~= "" and abs:sub(1, #root) == root then
    return abs:sub(#root + 2)
  end
  return vim.fn.expand("%")
end

vim.keymap.set("n", "<leader>yl", function()
  local ref = repo_relative_path() .. ":" .. vim.fn.line(".")
  vim.fn.setreg("+", ref)
  vim.notify(ref, vim.log.levels.INFO)
end, { desc = "Yank repo-relative file:line" })

vim.keymap.set("n", "<leader>yf", function()
  local path = repo_relative_path()
  vim.fn.setreg("+", path)
  vim.notify(path, vim.log.levels.INFO)
end, { desc = "Yank repo-relative file path" })

local function codediff_default_branch()
  for _, candidate in ipairs({ "dev", "main", "master" }) do
    for _, ref in ipairs({ candidate, "origin/" .. candidate }) do
      vim.fn.systemlist({ "git", "rev-parse", "--verify", "--quiet", ref })
      if vim.v.shell_error == 0 then
        return candidate
      end
    end
  end
  return "main"
end

vim.keymap.set("n", "<leader>gd", "<cmd>CodeDiff<cr>", { desc = "CodeDiff: working tree vs HEAD" })
vim.keymap.set("n", "<leader>gD", function()
  local ref = vim.fn.input("CodeDiff against ref: ", codediff_default_branch())
  if ref ~= "" then
    vim.cmd("CodeDiff " .. ref)
  end
end, { desc = "CodeDiff: against ref (prompt)" })
vim.keymap.set("n", "<leader>gH", "<cmd>CodeDiff history<cr>", { desc = "CodeDiff: history" })
vim.keymap.set("n", "<leader>gF", "<cmd>CodeDiff file HEAD<cr>", { desc = "CodeDiff: current file vs HEAD" })
vim.keymap.set("n", "<leader>gm", function()
  vim.cmd("CodeDiff " .. codediff_default_branch())
end, { desc = "CodeDiff: vs default branch" })
vim.keymap.set("n", "<leader>gP", function()
  vim.cmd("CodeDiff " .. codediff_default_branch() .. "...")
end, { desc = "CodeDiff: PR diff (default branch...HEAD)" })
