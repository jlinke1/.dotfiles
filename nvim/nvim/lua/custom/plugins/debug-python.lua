return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap-python',
  setup = function()
    require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
  end,
}
