return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- Color scheme
    use { 'sainnhe/gruvbox-material' }

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- LSP and completion
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/completion-nvim' }

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

    -- solarized 8
    --use { 'lifepillar/vim-solarized8' }

    -- Zig
    use { 'ziglang/zig.vim' }

    -- Language Servers
    use {
        'neovim/nvim-lspconfig',
        'kabouzeid/nvim-lspinstall'
    }


    -- Rip Grep
    use { 'jremmen/vim-ripgrep' }

    --Fzf (Need to learn how to use )
    -- use { 'vijaymarupudi/nvim-fzf' }

end)

