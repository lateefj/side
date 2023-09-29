
-- Keyboard maps
--
-- Window
local map = vim.keymap.set
map("n", "<leader>h", "<C-W>h", { desc = "left window" })
map("n", "<leader>j", "<C-W>j", { desc = "right window" })
map("n", "<leader>k", "<C-W>k", { desc = "up window" })
map("n", "<leader>l", "<C-W>l", { desc = "down window" })
map("n", "<leader>x", "<C-W>c", { desc = "close window" })
map("n", "<leader>s", "<C-W>s", { desc = "horizontal split" })
map("n", "<leader>v", "<C-W>v", { desc = "vertical split" })
map("n", "<leader>e", "<C-W>=", { desc = "equalize window splits" })
map("n", ">", "<C-W>>", { desc = "Increase window width" })
map("n", "<", "<C-W><", { desc = "Descrease window width" })
map("n", "-", ":resize -1<CR>", { desc = "Decrease window height" })
map("n", "+", ":resize +1<CR>", { desc = "Increase window height" })

-- Next
map("n", "<leader>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
-- Previous
map("n", "<leader>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
-- Copy / past to clip board
vim.keymap.set({ "n", "x" }, "cp", '"+y')
vim.keymap.set({ "n", "x" }, "cv", '"+p')

-- Select all text in current buffer
vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>")
--
-- Telescope
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
