return {
	{
		"tpope/vim-fugitive",
		enabled = true,
	},
	{
		dir = "~/plugins/alien.nvim",
		name = "alien",
		config = function()
			vim.g.alien_configuration = { command_mode_commands = { "G" } }
			require("alien").setup()
			local alien = require("alien")
			nmap("<leader>s", "<cmd>G status<CR>", "Alien Status")
			nmap("<leader>b", "<cmd>G branch<CR>", "Alien Branches")
			nmap("<leader>S", "<cmd>Lazy reload alien<cr>", "Reload Alien")
			nmap("gb", alien.blame, "Alien Blame")
			nmap("gs", "<cmd>G stash list<CR>", "Alien Stash")
		end,
	},
	{
		"sindrets/diffview.nvim",
		enabled = false,
		config = function()
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
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1
			vim.keymap.set("n", "<leader>j", "<cmd>LazyGit<CR>", { silent = true })
		end,
	},
}
