return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      file_ignore_patterns = { ".venv/", "%.venv/", "venv/", "__pycache__/", "node_modules/", ".mypy_cache/" },
    },
  },
  keys = {
    {
      ",f",
      function()
        require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
      end,
      desc = "Find Files",
    },
    {
      ",w",
      function()
        require("telescope.builtin").live_grep({
          additional_args = function()
            return { "--hidden", "--no-ignore" }
          end,
        })
      end,
      desc = "Grep in Files",
    },
  },
}
