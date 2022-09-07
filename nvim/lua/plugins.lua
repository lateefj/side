local helper = require('helper')
return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Color scheme
    use { '4513ECHO/vim-colors-hatsunemiku' }
    use { 'romainl/Apprentice' }
    -- use { 'sainnhe/everforest' }
    -- use { 'sainnhe/gruvbox-material' }
    -- use { 'morhetz/gruvbox' }
    --use { 'lifepillar/vim-gruvbox8' }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- Language Servers
    use {
        'neovim/nvim-lspconfig',
        'kabouzeid/nvim-lspinstall',
        'onsails/lspkind-nvim'

    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        config = function() require'nvim-tree'.setup {
                helper.map(helper.MODE.NMAP, '<M-t>', ':NvimTreeToggle<CR>', { noremap = true, silent = true})
        } end
    }

    use {
	    'nvim-lualine/lualine.nvim',
	    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- completion
    use { 'hrsh7th/nvim-compe' }

    -- Lua development
    use { 'tjdevries/nlua.nvim' }

    -- Vim dispatch
    use { 'tpope/vim-dispatch' }

    -- Fugitive for Git
    use { 'tpope/vim-fugitive' }

    -- Go
    use { 'fatih/vim-go' }

    -- XXX: THIS IS REALLY SLOW ON OS X
    -- polyglot
    --
    -- use { 'sheerun/vim-polyglot' }

    -- Fish
    use { 'dag/vim-fish'}

    -- Awk
    use { 'vim-scripts/awk.vim' }

    -- C
    use { 'justmao945/vim-clang' }

    -- Prolog
    use { 'soli/prolog-vim' }

    -- Zig
    use { 'ziglang/zig.vim' }

    -- SQL
    use { 
        'lighttiger2505/sqls',
        'nanotee/sqls.nvim' 
    }

    -- Markdown
    use {"ellisonleao/glow.nvim"}

    -- Asciidoc
    use {'habamax/vim-asciidoctor'}
end)

