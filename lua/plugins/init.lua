
return {
    'tpope/vim-surround',
    'chrisbra/improvedft',

    -- colorschemes
    {'nvim-treesitter/nvim-treesitter', cmd =  'TSUpdate'},
    {'catppuccin/nvim', name = 'catppuccin'},
    'rebelot/kanagawa.nvim',

    'tpope/vim-commentary',
    'preservim/nerdtree',
    -- {'junegunn/fzf', cmd = function() vim.call('fzf#install') end},
    'junegunn/fzf.vim',
    'tpope/vim-repeat',
    'tpope/vim-unimpaired',
    'svermeulen/vim-cutlass',
    'ggandor/leap.nvim',
    'svermeulen/vim-subversive',
    'rhysd/clever-f.vim',
    'ggandor/leap-spooky.nvim',

    -- LSP Support
    'neovim/nvim-lspconfig',                           -- Required
    {'williamboman/mason.nvim', cmd = 'MasonUpdate'}, -- Optional
    'williamboman/mason-lspconfig.nvim',               -- Optional

    -- Autocompletion Engine
    'hrsh7th/nvim-cmp',         -- Required
    'hrsh7th/cmp-nvim-lsp',     -- Required
    'hrsh7th/cmp-buffer',       -- Optional
    'hrsh7th/cmp-path',         -- Optional
    'saadparwaiz1/cmp_luasnip', -- Optional
    'hrsh7th/cmp-nvim-lua',     -- Optional

    --  Snippets
    'L3MON4D3/LuaSnip',             -- Required
    'rafamadriz/friendly-snippets', -- Optional

    {'VonHeikemen/lsp-zero.nvim', branch = 'v1.x'},
}
