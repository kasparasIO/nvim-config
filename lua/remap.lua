local builtin = require("telescope.builtin")
local harpoon = require("harpoon")
local toggle_telescope = require("harpoon_utils")

vim.g.mapleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
--telescope
vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "telescope find files"})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "telescope grep files"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "find buffers"})
--harpoon
vim.keymap.set("n", "<leader>ha", function () toggle_telescope(harpoon:list()) end)
vim.keymap.set("n", "<leader>hi", function () harpoon:list():add() end)

vim.keymap.set("n", "<leader>r1", function() harpoon:list():remove_at(1) end)
vim.keymap.set("n", "<leader>r2", function() harpoon:list():remove_at(2) end)
vim.keymap.set("n", "<leader>r3", function() harpoon:list():remove_at(3) end)
vim.keymap.set("n", "<leader>r4", function() harpoon:list():remove_at(4) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

