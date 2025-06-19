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

-- Clear search
map("n", "<leader>c", ":noh<cr>")
-- Copy / past to clip board
map({ "n", "x" }, "cp", '"+y')
map({ "n", "x" }, "cv", '"+p')

-- Terminal short cuts
map('n', '<leader>tt', ':terminal<cr>', { desc = 'New Terminal' })
map('n', '<leader>tv', [[<cmd>vsplit | term<cr>A]], { desc = 'Open terminal in vertical split' })
map('n', '<leader>th', [[<cmd>split | term<cr>A]], { desc = 'Open terminal in horizontal split' })
map('t', '<ESC>', '<C-\\><C-n>', { desc = 'Escape to exit insert mode' })
map('t', '<A-h>', '<C-\\><C-N><C-w>h', { desc = 'Got to left term' })
map('t', '<A-j>', '<C-\\><C-N><C-w>h', { desc = 'Got to right term' })
map('t', '<A-k', '<C-\\><C-N><C-w>h', { desc = 'Got to up term' })
map('t', '<A-l', '<C-\\><C-N><C-w>h', { desc = 'Got to down term' })
map('n', '<leader>tf', ':FloatermNew<cr>', { desc = 'New Floating Terminal' })

map('n', '<leader>xx', '<cmd>Trouble diagnostics<cr>')
-- Zig Test
map("n", "<leader>zt", "<cmd>ZigTest<cr>", { desc = "ZigTest" })
