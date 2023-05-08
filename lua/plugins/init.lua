local not_vscode = vim.g.vscode == nil
return {
    'tpope/vim-surround',
    'kdheepak/lazygit.nvim',
    'chrisbra/improvedft',

    -- colorschemes
    {'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate', cond = not_vscode, lazy = true},
    -- {'catppuccin/nvim', name = 'catppuccin', cond = not_vscode},
    {'rebelot/kanagawa.nvim', cond = not_vscode},

    'tpope/vim-commentary',
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {
            view = { width = {} },
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
            enable = true,
            update_root = true
  },
        }
      end,
      cond = not_vscode,
    },
    -- Font for icons here: https://webinstall.dev/nerdfont/
    'tpope/vim-repeat',
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
      cond = not_vscode,
      lazy = true,
    },
    { 'mfussenegger/nvim-jdtls', cond = not_vscode, lazy = true },
    { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },
    {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
},
{
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' }
},
{'flazz/vim-colorschemes'},
{'christoomey/vim-tmux-navigator'},
}
