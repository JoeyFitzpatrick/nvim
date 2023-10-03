local not_vscode = vim.g.vscode == nil
return {
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "kdheepak/lazygit.nvim", event = "VeryLazy" },
	{ "tpope/vim-commentary", event = "VeryLazy" },
	{ "tpope/vim-abolish", event = "VeryLazy" },
	{ "tpope/vim-sensible", event = "VeryLazy" },
	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
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
	{ "tpope/vim-repeat", event = "VeryLazy" },

	-- LSP Support
	{
		"VonHeikemen/lsp-zero.nvim",
		event = "VeryLazy",
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
	},
	{ "mfussenegger/nvim-jdtls", cond = not_vscode, event = "VeryLazy" },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
	},
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{ "f-person/git-blame.nvim", event = "VeryLazy" },
	{ "https://gitlab.com/schrieveslaach/sonarlint.nvim", event = "VeryLazy" },
	{ "mfussenegger/nvim-lint", event = "VeryLazy" },
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
		event = "VeryLazy",
		cond = not_vscode,
		config = function()
			require("marks").setup({})
		end,
	},
	-- {
	-- 	"mrcjkb/haskell-tools.nvim",
	-- 	event = "VeryLazy",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim", -- optional
	-- 	},
	-- 	branch = "1.x.x", -- recommended
	-- },
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
		event = "VeryLazy",
		cond = not_vscode,
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"gelguy/wilder.nvim",
		event = "VeryLazy",
		cond = not_vscode,
		config = function()
			local wilder = require("wilder")
			wilder.setup({ modes = { ":", "/", "?" } })
		end,
	},
	{
		"pmizio/typescript-tools.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{
		"folke/trouble.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{ "https://github.com/windwp/nvim-ts-autotag", event = "VeryLazy" },
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		event = "VeryLazy",
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
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
					"RainbowDelimiterRed",
				},
			}
		end,
	},
	{ "github/copilot.vim", lazy = false, event = "VeryLazy" },
	{ "catppuccin/nvim", name = "catppuccin", event = "VeryLazy" },
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
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{ "rhysd/clever-f.vim", event = "VeryLazy" },
	{
		"mbbill/undotree",
		event = "VeryLazy",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
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
