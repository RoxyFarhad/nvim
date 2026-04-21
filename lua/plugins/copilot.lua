return {
  -- Disable Copilot
  { "zbirenbaum/copilot.lua", enabled = false },

  -- Supermaven AI autocomplete
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    opts = {
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      ignore_filetypes = {},
      color = {
        suggestion_color = "#585858",
      },
      log_level = "off",
    },
  },

  -- Update blink.cmp Tab key since Supermaven handles it now
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        preset = "default",
        ["<Tab>"] = {},
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
    },
  },
}
