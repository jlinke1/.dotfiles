return {
  { "folke/tokyonight.nvim", opts = { transparent = true } },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}

-- return {
--   -- add gruvbox
--   {
--     "sainnhe/gruvbox-material",
--     priority = 1000,
--     config = function()
--       vim.g.gruvbox_material_transparent_background = 100
--       vim.g.gruvbox_material_foreground = "mix"
--       vim.g.gruvbox_material_background = "hard"
--       vim.g.gruvbox_material_ui_contrast = "high"
--       vim.g.gruvbox_material_float_style = "bright"
--       vim.g.gruvbox_material_statusline_style = "material"
--       vim.g.gruvbox_material_cursor = "auto"
--     end,
--   },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox-material",
--     },
--   },
-- }
