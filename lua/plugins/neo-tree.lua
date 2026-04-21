return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>gs", "<cmd>Neotree git_status toggle left<cr>", desc = "Git status sidebar" },
  },
  opts = {
    sources = { "filesystem", "buffers", "git_status" },
    source_selector = {
      winbar = true,
      sources = {
        { source = "filesystem" },
        { source = "buffers" },
        { source = "git_status" },
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    },
    git_status = {
      window = {
        position = "left",
        mappings = {
          ["A"]  = "git_add_all",
          ["ga"] = "git_add_file",
          ["gu"] = "git_unstage_file",
          ["gr"] = "git_reset_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
        },
      },
    },
  },
}
