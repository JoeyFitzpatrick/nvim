local not_vscode = vim.g.vscode == nil
return {
	{ "tpope/vim-surround", event = "VeryLazy" },
	{
		"kdheepak/lazygit.nvim",
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 0.95
		end,
	},
	{ "tpope/vim-commentary", event = "VeryLazy" },
	-- { "tpope/vim-abolish",     event = "VeryLazy" },
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
				filters = {
					git_ignored = false,
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
				dependencies = {
					"saadparwaiz1/cmp_luasnip",
					-- "rafamadriz/friendly-snippets",
				},
			}, -- Required
		},
		cond = not_vscode,
	},
	{
		"ThePrimeagen/harpoon",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
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
	{
		"johmsalas/text-case.nvim",
		config = function()
			require("textcase").setup({})
		end,
	},
	{
		"rlane/pounce.nvim",
		event = "VeryLazy",
		config = function()
			local map = vim.keymap.set
			map("n", "s", function()
				require("pounce").pounce({})
			end)
			map("n", "S", function()
				require("pounce").pounce({ do_repeat = true })
			end)
			map("x", "s", function()
				require("pounce").pounce({})
			end)
			map("o", "gs", function()
				require("pounce").pounce({})
			end)
		end,
	},
}
