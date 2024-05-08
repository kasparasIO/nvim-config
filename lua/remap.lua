local builtin = require("telescope.builtin")
local harpoon = require("harpoon")
local toggle_telescope = require("harpoon_utils")

vim.g.mapleader = " "
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- moving lines
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")

-- yank to plus register
vim.keymap.set("v", "<S-Y>", '"+y', {desc = "yank to clipboard register"})

--buffers
vim.keymap.set("n", "<leader>a", ":bprevious<CR>", {remap = true})
vim.keymap.set("n", "<leader>d", ":bnext<CR>", {remap = true})
vim.keymap.set("n", "<leader>w", ":bd!<CR>", {remap = true})
--netrw
vim.keymap.set("n", "<leader>o", vim.cmd.Ex, {noremap = true})

vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    -- edit new file
    vim.keymap.set("n", 'n', '%', {remap = true, buffer = true})

    -- create dir
    vim.keymap.set("n", 'f', "d", {remap = true, buffer = true})
    --remove file 
    vim.keymap.set("n", 'x', "<del>", {remap = true, buffer = true})

    -- rename file
    vim.keymap.set("n", 'r', 'R', {remap = true, buffer = true})
  end
})



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

