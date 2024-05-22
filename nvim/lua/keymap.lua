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

-- Telescope
map('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
map('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
map('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
-- Zig Test
map("n", "<leader>zt", "<cmd>ZigTest<cr>", { desc = "ZigTest" })
-- See `:help telescope.builtin`
map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

map('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

local nmap = function(keys, func, desc)
  if desc then
    desc = 'LSP: ' .. desc
  end

  map('n', keys, func, { desc = desc })
end


-- See `:help K` for why this keymap
nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

-- Lesser used LSP functionality
nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
nmap('<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, '[W]orkspace [L]ist Folders')

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
