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
			nmap("<leader>s", "<cmd>G status<CR>", "Alien Status")
			nmap("<leader>b", "<cmd>G branch<CR>", "Alien Branches")
			nmap("gb", "<cmd>G blame<CR>", "Alien Blame")
			nmap("gs", "<cmd>G stash list<CR>", "Alien Stash")
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
