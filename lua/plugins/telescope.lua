return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = { ".venv/", "%.venv/", "venv/", "__pycache__/", "node_modules/", ".mypy_cache/" },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
    keys = {
      {
        "<leader>f",
        function()
          require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
        end,
        desc = "Find Files",
      },
      {
        "<leader>w",
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
  },
}
