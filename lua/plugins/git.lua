return {
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		config = function()
			require("diffview").setup({})
			vim.keymap.set(
				"n",
				"<leader>kh",
				"<cmd>DiffviewFileHistory %<CR>",
				{ silent = true, desc = "File history" }
			)
		end,
	},
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		branch = "nightly",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
	{
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup({
				date_format = "%m/%d/%Y",
			})
		end,
		keys = {
			{ "<leader>kl", "<cmd>BlameToggle<CR>", desc = "Toggle blame window" },
			{ "<leader>kL", "<cmd>BlameToggle virtual<CR>", desc = "Toggle virtual blame" },
		},
	},
	{
		"SuperBo/fugit2.nvim",
		opts = {
			height = "80%",
			width = "80%",
			libgit2_path = "/opt/homebrew/lib/libgit2.dylib",
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{
				"chrisgrieser/nvim-tinygit", -- optional: for Github PR view
				dependencies = { "stevearc/dressing.nvim" },
			},
		},
		cmd = { "Fugit2", "Fugit2Diff", "Fugit2Graph" },
		keys = {
			{ "<leader>F", mode = "n", "<cmd>Fugit2<cr>" },
		},
	},
	{ "ThePrimeagen/git-worktree.nvim" },
	{ "tpope/vim-fugitive" },
}
