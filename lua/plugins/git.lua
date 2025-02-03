return {
	{ "tpope/vim-fugitive", enabled = true },
	{
		dir = "~/plugins/ever.nvim",
		name = "ever",
		enabled = true,
		config = function()
			vim.keymap.set("n", "g<space>", ":G ", { desc = "Ever Prefix" })
			vim.keymap.set("n", "<leader>je", "<cmd>G<CR>", { desc = "Open Ever Home UI" })
			vim.keymap.set("n", "<leader>jd", "<cmd>G difftool<CR>", { desc = "Open Ever Difftool" })
			vim.keymap.set(
				"n",
				"<leader>jt",
				"<cmd>G difftool status-file-tree<CR>",
				{ desc = "Open Ever for testing" }
			)
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
		enabled = true,
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
}
