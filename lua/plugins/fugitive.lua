return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit", "Glog", "Gwrite", "Gread" },
  keys = {
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
  },
}
