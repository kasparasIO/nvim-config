local builtin = require("telescope.builtin")

vim.g.mapleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "telescope find files"})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "telescope grep files"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "find buffers"})


