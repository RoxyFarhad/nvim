return {
  -- Keep tokyonight installed (LazyVim dependency) but don't activate it
  { "folke/tokyonight.nvim" },

  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})
      vim.cmd("colorscheme github_light")
    end,
  },
}
