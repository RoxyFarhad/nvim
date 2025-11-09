return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "day", -- The theme comes in four styles: storm, moon, night, and day
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
      },
    })
    -- Load the colorscheme
    vim.cmd([[colorscheme tokyonight-day]])
  end,
}
