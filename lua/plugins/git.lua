return {
	{ "tpope/vim-fugitive", enabled = true },
	{
		dir = "~/plugins/ever.nvim",
		name = "ever",
		enabled = true,
		config = function()
			vim.keymap.set({ "n", "v" }, "g<space>", ":G ", { desc = "Ever Prefix" })
			vim.keymap.set("n", "<leader>je", "<cmd>G<CR>", { desc = "Open Ever Home UI" })
			vim.keymap.set("n", "<leader>jd", "<cmd>G difftool<CR>", { desc = "Open Ever Difftool" })
			vim.keymap.set("n", "<leader>jb", "<cmd>G blame<CR>", { desc = "Open Ever Blame" })
			vim.keymap.set("n", "<leader>jm", "<cmd>G mergetool<CR>", { desc = "Open Mergetool" })
			vim.keymap.set("n", "<leader>jt", "<cmd>G branch --all<CR>", { desc = "Open Ever for testing" })
			vim.keymap.set("n", "<leader>rb", "<Plug>(Ever-resolve-base)", { desc = "Ever merge conflict base" })
			vim.keymap.set("n", "<leader>ro", "<Plug>(Ever-resolve-ours)", { desc = "Ever merge conflict ours" })
			vim.keymap.set("n", "<leader>rt", "<Plug>(Ever-resolve-theirs)", { desc = "Ever merge conflict theirs" })
			vim.keymap.set("n", "<leader>ra", "<Plug>(Ever-resolve-all)", { desc = "Ever merge conflict all" })
		end,
	},
	{
		dir = "~/plugins/alien.nvim",
		name = "alien",
		enabled = true,
		config = function()
			vim.g.alien_configuration = { command_mode_commands = { "A" } }
			require("alien").setup()
		end,
	},
	{
		"sindrets/diffview.nvim",
		enabled = false,
		event = "VeryLazy",
		config = function()
			-- vim.keymap.set("n", "<leader>jd", "<cmd>DiffviewOpen<CR>", { desc = "Open Diffview" })
			require("diffview").setup({
				view = {
					merge_tool = {
						layout = "diff3_mixed",
					},
				},
			})
		end,
	},

	{
		"NeogitOrg/neogit",
		cmd = { "Neogit" },
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		config = true,
	},
}
