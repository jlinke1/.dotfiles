-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "hh", "<Esc>", { noremap = false })

vim.keymap.set("v", "<leader>dd", function()
  local ft = vim.bo.filetype
  local selected_text = vim.fn.getreg('"', 1)
  local line_num = vim.api.nvim_win_get_cursor(0)[1]
  local buf = 0
  local current_line = vim.api.nvim_buf_get_lines(buf, line_num - 1, line_num, false)[1]
  local indent = current_line:match("^%s*") or ""

  if ft == "go" then
    local printf_line = string.format('%sfmt.Printf("%s: {%%v}", %s)', indent, selected_text, selected_text)
    vim.api.nvim_buf_set_lines(buf, line_num, line_num, false, { printf_line })
  else
    print("Unsupported filetype for <leader>dd")
  end
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
