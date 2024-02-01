return {
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
	{ "nvim-pack/nvim-spectre", lazy = true },
}
