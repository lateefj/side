return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Color scheme
    -- use { 'sainnhe/gruvbox-material' }
    use { 'lifepillar/vim-gruvbox8' }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- Language Servers
    use {
        'neovim/nvim-lspconfig',
        'kabouzeid/nvim-lspinstall'
    }
    -- completion
    use { 'hrsh7th/nvim-compe' }

    -- Lua development
    use { 'tjdevries/nlua.nvim' }

    -- Vim dispatch
    use { 'tpope/vim-dispatch' }

    -- Fugitive for Git
    use { 'tpope/vim-fugitive' }

    -- NERDTree
    use { 'scrooloose/nerdtree' }

    -- Go
    use { 'fatih/vim-go' }

    -- polyglot
    use { 'sheerun/vim-polyglot' }

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

    -- Rip Grep
    use { 'jremmen/vim-ripgrep' }

    -- SQL
    use { 'nanotee/sqls.nvim' }
    --Fzf (Need to learn how to use )
    -- use { 'vijaymarupudi/nvim-fzf' }
    --
    -- FLutter tools
    use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim'}


end)

