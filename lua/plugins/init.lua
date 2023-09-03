local not_vscode = vim.g.vscode == nil
return {
	"tpope/vim-surround",
	"kdheepak/lazygit.nvim",
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
			{
				"neovim/nvim-lspconfig",
				dependencies = {
					{
						"SmiteshP/nvim-navbuddy",
						dependencies = {
							"SmiteshP/nvim-navic",
							"MunifTanjim/nui.nvim",
							"numToStr/Comment.nvim", -- Optional
							"nvim-telescope/telescope.nvim", -- Optional
						},
						opts = { lsp = { auto_attach = true } },
					},
				},
			}, -- Required
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
	-- {
	-- 	"windwp/nvim-autopairs",
	-- 	config = function()
	-- 		require("nvim-autopairs").setup({})
	-- 	end,
	-- },
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
	{ "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim" },
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
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim", -- optional
		},
		branch = "1.x.x", -- recommended
	},
	{
		"tzachar/highlight-undo.nvim",
		lazy = true,
		config = function()
			require("highlight-undo").setup({
				hlgroup = "HighlightUndo",
				duration = 300,
				keymaps = {
					{ "n", "u", "undo", {} },
					{ "n", "<C-r>", "redo", {} },
				},
			})
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
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
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
}

