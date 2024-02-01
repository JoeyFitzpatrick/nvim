return {
	{ "tpope/vim-surround", event = "VeryLazy" },
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1
		end,
	},
	{ "tpope/vim-commentary", event = "VeryLazy" },
	-- { "tpope/vim-abolish",     event = "VeryLazy" },
	{ "tpope/vim-sensible", event = "VeryLazy" },
	{ "tpope/vim-repeat", event = "VeryLazy" },
	{ "ThePrimeagen/harpoon", event = "VeryLazy", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	{ "f-person/git-blame.nvim", event = "VeryLazy" },
	{ "https://gitlab.com/schrieveslaach/sonarlint.nvim", event = "VeryLazy" },
	{ "mfussenegger/nvim-lint", event = "VeryLazy" },
	{
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"folke/which-key.nvim",
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
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	{
		"gelguy/wilder.nvim",
		event = "VeryLazy",
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
	{ "folke/trouble.nvim", event = "VeryLazy", dependencies = { "nvim-tree/nvim-web-devicons" }, opts = {} },
	{ "https://github.com/windwp/nvim-ts-autotag", event = "VeryLazy" },
	{ "stevearc/conform.nvim", event = "VeryLazy", opts = {} },
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
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"nvim-telescope/telescope.nvim", -- optional
			"sindrets/diffview.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
	{ "dmmulroy/tsc.nvim", event = "VeryLazy", config = true },
	{ "stevearc/dressing.nvim", event = "VeryLazy", opts = {} },
	{ "kevinhwang91/nvim-bqf", event = "VeryLazy" },
	{ "folke/neodev.nvim", event = "VeryLazy", opts = {} },
}
