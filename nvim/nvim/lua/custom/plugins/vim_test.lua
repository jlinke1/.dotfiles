return {
  'vim-test/vim-test',
  vim.keymap.set('n', '<leader>tt', ':TestNearest<CR>'),
  vim.keymap.set('n', '<leader>T', ':TestFile<CR>'),
  vim.keymap.set('n', '<leader>ta', ':TestSuite<CR>'),
  vim.keymap.set('n', '<leader>tl', ':TestLast<CR>'),
  vim.keymap.set('n', '<leader>tg', ':TestVisit<CR>'),
  vim.cmd("let test#strategy = 'neovim'"),
}
