local not_vscode = vim.g.vscode == nil
return {
	"tpope/vim-surround",
	"kdheepak/lazygit.nvim",
	"chrisbra/improvedft",

	-- colorschemes
	{ "nvim-treesitter/nvim-treesitter", cmd = "TSUpdate", cond = not_vscode, lazy = false },
	{ "rebelot/kanagawa.nvim", cond = not_vscode },
	"tpope/vim-commentary",
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = { width = {} },
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
			})
		end,
		cond = not_vscode,
	},
	-- Font for icons here: https://webinstall.dev/nerdfont/
	"tpope/vim-repeat",
	"ggandor/leap.nvim",
	"rhysd/clever-f.vim",
	"ggandor/leap-spooky.nvim",

	-- LSP Support
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{
				"L3MON4D3/LuaSnip",
				dependencies = { "honza/vim-snippets", "saadparwaiz1/cmp_luasnip" },
			}, -- Required
		},
		cond = not_vscode,
		lazy = false,
	},
	{ "mfussenegger/nvim-jdtls", cond = not_vscode, lazy = false },
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "flazz/vim-colorschemes", cond = not_vscode, lazy = true },
	{ "christoomey/vim-tmux-navigator" },
	{ "f-person/git-blame.nvim" },
	{ "https://gitlab.com/schrieveslaach/sonarlint.nvim" },
	{ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "nvim-pack/nvim-spectre", cond = not_vscode, lazy = true },
	-- { "tpope/vim-dadbod", cond = not_vscode, lazy = true },
	{
		"goolord/alpha-nvim",
		cond = not_vscode,
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"ecthelionvi/NeoComposer.nvim",
		dependencies = { "kkharji/sqlite.lua" },
		opts = {},
	},
	{
		"chentoast/marks.nvim",
		cond = not_vscode,
		config = function()
			require("marks").setup({})
		end,
	},
}
