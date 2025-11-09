return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local catppuccin = require("lualine.themes.catppuccin")
    opts.options.theme = catppuccin
    opts.sections = {
      lualine_a = {
        { "mode", separator = { left = "" }, right_padding = 2 },
      },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { "filetype", "progress" },
      lualine_z = {
        { "location", separator = { right = "" }, left_padding = 2 },
      },
    }
  end,
}
