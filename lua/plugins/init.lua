local not_vscode = vim.g.vscode == nil
return {
	"tpope/vim-surround",
	"kdheepak/lazygit.nvim",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, event = "VeryLazy" },
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
	"tpope/vim-repeat",

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
				dependencies = { "honza/vim-snippets", "saadparwaiz1/cmp_luasnip", "mlaursen/vim-react-snippets" },
			}, -- Required
		},
		cond = not_vscode,
		lazy = false,
	},
	{ "mfussenegger/nvim-jdtls", cond = not_vscode, lazy = false },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "christoomey/vim-tmux-navigator" },
	{ "f-person/git-blame.nvim" },
	{ "https://gitlab.com/schrieveslaach/sonarlint.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "nvim-pack/nvim-spectre", cond = not_vscode, lazy = true },
	{
		"goolord/alpha-nvim",
		cond = not_vscode,
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"chentoast/marks.nvim",
		cond = not_vscode,
		config = function()
			require("marks").setup({})
		end,
	},
	{
		"mrcjkb/haskell-tools.nvim",
		event = "VeryLazy",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim", -- optional
		},
		branch = "1.x.x", -- recommended
	},
	{
		"folke/which-key.nvim",
		cond = not_vscode,
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
		end,
		opts = {},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		cond = not_vscode,
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"gelguy/wilder.nvim",
		cond = not_vscode,
		config = function()
			local wilder = require("wilder")
			wilder.setup({ modes = { ":", "/", "?" } })
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{ "https://github.com/windwp/nvim-ts-autotag" },
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		config = function()
			-- This module contains a number of default definitions
			local rainbow_delimiters = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
	{ "github/copilot.vim", lazy = false },
	{
		"ramojus/mellifluous.nvim",
		config = function()
			require("mellifluous").setup({
                color_set = "mountain",
				mountain = {
					color_overrides = {
						dark = {
							bg = "#14191f",
						},
					},
				},
			})
			vim.cmd("colorscheme mellifluous")
		end,
	},
	-- {
	-- 	"NeogitOrg/neogit",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- required
	-- 		"nvim-telescope/telescope.nvim", -- optional
	-- 		"sindrets/diffview.nvim", -- optional
	-- 		"ibhagwan/fzf-lua", -- optional
	-- 	},
	-- 	config = true,
	-- },
}
