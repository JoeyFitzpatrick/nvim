local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'chrisbra/improvedft'

-- colorschemes
Plug ('nvim-treesitter/nvim-treesitter', {['do'] =  ':TSUpdate'})
Plug ('catppuccin/nvim', { as = 'catppuccin' })
Plug 'rebelot/kanagawa.nvim'

Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug('junegunn/fzf', { ['do'] = function() vim.call('fzf#install') end })
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'svermeulen/vim-cutlass'
Plug 'ggandor/leap.nvim'
Plug 'svermeulen/vim-subversive'
Plug 'rhysd/clever-f.vim'
Plug 'ggandor/leap-spooky.nvim'

-- LSP Support
Plug 'neovim/nvim-lspconfig'                           -- Required
Plug('williamboman/mason.nvim', {['do'] = ':MasonUpdate'}) -- Optional
Plug 'williamboman/mason-lspconfig.nvim'               -- Optional

-- Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         -- Required
Plug 'hrsh7th/cmp-nvim-lsp'     -- Required
Plug 'hrsh7th/cmp-buffer'       -- Optional
Plug 'hrsh7th/cmp-path'         -- Optional
Plug 'saadparwaiz1/cmp_luasnip' -- Optional
Plug 'hrsh7th/cmp-nvim-lua'     -- Optional

--  Snippets
Plug 'L3MON4D3/LuaSnip'             -- Required
Plug 'rafamadriz/friendly-snippets' -- Optional

Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v1.x'})

vim.call('plug#end')

require('leap').add_default_mappings()
require('leap-spooky').setup()
require('treesitter-config')
require('remap')
require('set')

-- clever-f settings
-- g:clever_f_smart_case = 1



-- non-vscode settings
if vim.g.vscode ~= nil then
    -- VSCode only settings
else
    -- ordinary Neovim settings
	require('lsp')
	vim.opt.relativenumber = true
	vim.cmd('colorscheme kanagawa')
	-- vim.cmd('colorscheme catppuccin-latte') -- catppuccin, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
end
