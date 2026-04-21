-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Set leader key to comma
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Override LazyVim's <leader>w with live grep
vim.keymap.set("n", "<leader>w", function()
  require("telescope.builtin").live_grep({
    additional_args = function()
      return { "--hidden", "--no-ignore" }
    end,
  })
end, { desc = "Grep in Files" })
