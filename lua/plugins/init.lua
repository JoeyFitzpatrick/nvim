local not_vscode = vim.g.vscode == nil
return {
    'tpope/vim-surround',
    'chrisbra/improvedft',

    -- colorschemes
    {'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate', cond = not_vscode},
    {'catppuccin/nvim', name = 'catppuccin', cond = not_vscode},
    {'rebelot/kanagawa.nvim', cond = not_vscode},

    'tpope/vim-commentary',
    {'tpope/vim-fugitive', cond = not_vscode},
    { 'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {}
      end,
      cond = not_vscode,
    },
    -- Font for icons here: https://webinstall.dev/nerdfont/
    -- {'junegunn/fzf', cmd = function() vim.call('fzf#install') end},
    'junegunn/fzf',
    'junegunn/fzf.vim',
    'tpope/vim-repeat',
    'tpope/vim-unimpaired',
    'svermeulen/vim-cutlass',
    'ggandor/leap.nvim',
    'rhysd/clever-f.vim',
    'ggandor/leap-spooky.nvim',

    -- LSP Support
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
          'williamboman/mason.nvim',
          build = function()
            pcall(vim.cmd, 'MasonUpdate')
          end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      },
      cond = not_vscode
    },
    { 'mfussenegger/nvim-jdtls', cond = not_vscode }, -- uncomment this when ready for better java setup
    'kana/vim-textobj-user',
    'bps/vim-textobj-python',
}
