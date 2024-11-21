local function codeium_status()
  -- Call the Vimscript function using vim.fn
  local codeium_str = vim.fn["codeium#GetStatusString"]()

  -- Prepend a string to the codeium string
  return "{...}: " .. codeium_str
end

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = true,
      theme = 'gruvbox-material',
      component_separators = '|',
      section_separators = '',
    },
    sections = {
      lualine_a = {
        'buffers',
      },
      lualine_c = {
        { codeium_status, color = { fg = "#ffffff", gui = "bold" } },
      },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        "location"
      },
    }
  },
}
