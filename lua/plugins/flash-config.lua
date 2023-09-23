return {
	"folke/flash.nvim",
	event = "VeryLazy",
	cond = vim.g.vscode == nil,
	---@type Flash.Config
	opts = {},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				-- default options: exact mode, multi window, all directions, with a backdrop
				require("flash").jump()
			end,
		},
		{
			"<leader>ts",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
	},
	config = function()
		require("flash").setup({
			modes = {
				search = {
					enabled = false,
				},
				char = {
					enabled = true,
					-- by default all keymaps are enabled, but you can disable some of them,
					-- by removing them from the list.
					keys = { "f", "F", "t", "T" },
					search = { wrap = false },
					highlight = { backdrop = true },
					jump = { register = false },
                    jump_labels = true,
				},
			},
		})
	end,
}
