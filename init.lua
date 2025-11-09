-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Custom keymaps for indenting with [] keys
vim.keymap.set('v', ']', '>', { noremap = true })
vim.keymap.set('v', '[', '<', { noremap = true })

-- Custom keymap for commenting with tt
vim.keymap.set('v', 'tt', ':s/^/# /<CR>', { noremap = true, silent = true })
