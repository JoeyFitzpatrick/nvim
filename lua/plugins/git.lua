return {
	{ "tpope/vim-fugitive", enabled = true },
	{
		dir = "~/plugins/trunks.nvim",
		name = "trunks",
		enabled = true,
		config = function()
			---@module "trunks"
			---@type trunks.Configuration
			vim.g.trunks_configuration = { pager = "delta", prevent_nvim_inception = true }
			vim.keymap.set({ "n", "v" }, "t<space>", ":Trunks ", { desc = "Trunks Prefix" })
			vim.keymap.set({ "n", "v" }, "g<space>", ":G ", { desc = "Trunks Git Prefix" })
			vim.keymap.set("n", "<leader>je", "<cmd>G<CR>", { desc = "Open Trunks Home UI" })
			vim.keymap.set("n", "<leader>jd", "<cmd>G difftool<CR>", { desc = "Open Trunks Difftool" })
			vim.keymap.set("n", "<leader>jb", "<cmd>G blame<CR>", { desc = "Open Trunks Blame" })
			vim.keymap.set("n", "<leader>jm", "<cmd>G mergetool<CR>", { desc = "Open Mergetool" })
			vim.keymap.set("n", "<leader>jl", "<cmd>G log<CR>", { desc = "Open Git Log" })
			vim.keymap.set("n", "<leader>rb", "<Plug>(Trunks-resolve-base)", { desc = "Trunks merge conflict base" })
			vim.keymap.set("n", "<leader>ro", "<Plug>(Trunks-resolve-ours)", { desc = "Trunks merge conflict ours" })
			vim.keymap.set(
				"n",
				"<leader>rt",
				"<Plug>(Trunks-resolve-theirs)",
				{ desc = "Trunks merge conflict theirs" }
			)
			vim.keymap.set("n", "<leader>ra", "<Plug>(Trunks-resolve-all)", { desc = "Trunks merge conflict all" })

			-- Testing keymaps
			vim.keymap.set(
				{ "n", "x" },
				"<leader>jt",
				"<cmd>Trunks time-machine<CR>",
				{ desc = "Open Trunks for testing" }
			)
		end,
	},
	{
		"NeogitOrg/neogit",
		enabled = false,
		cmd = { "Neogit" },
		keys = { { "<leader>jj", "<cmd>Neogit<CR>", desc = "Open Neogit" } },
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
		},
		config = true,
	},
}
