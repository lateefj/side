
vim.o.background = "dark" -- or "light" for light mode
-- vim.cmd([[colorscheme gruvbox-material]])
vim.cmd([[colorscheme gruvbox8]])

--[[ Configure completion ]]--
vim.cmd([[autocmd BufEnter * lua require'completion'.on_attach()]])
-- Use <Tab> and <S-Tab> to navigate through popup menu
vim.cmd([[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]])
vim.cmd([[inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"]])
-- Set completeopt to have a better completion experience
vim.cmd([[set completeopt=menuone,noinsert,noselect]])
-- Avoid showing message extra message when using completion
vim.cmd([[set shortmess+=c]])
-- Disable Autompopup
--vim.g.completion_enable_auto_popup=0

-- Language server
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

