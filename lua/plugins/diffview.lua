return {
  -- Disable Snacks default <leader>gd (hunks picker) so diffview owns it
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gd", false },
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewToggleFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview open" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Diffview close" },
      { "<leader>gt", "<cmd>DiffviewToggleFiles<cr>", desc = "Diffview toggle files panel" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current)" },
      { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "File history (branch)" },
    },
    opts = {
      default_args = {
        DiffviewOpen = { "--untracked-files=all" },
      },
    },
  },
}
