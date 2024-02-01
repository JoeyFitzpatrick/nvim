return {
	{
		"ramojus/mellifluous.nvim",
		config = function()
			require("mellifluous").setup({
				color_set = "mountain",
				mountain = {
					color_overrides = {
						dark = {
							bg = "#14191f",
						},
					},
				},
			})
			-- vim.cmd("colorscheme mellifluous")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		event = "VeryLazy",
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		event = "VeryLazy",
		config = function()
			-- This module contains a number of default definitions
			local rainbow_delimiters = require("rainbow-delimiters")

			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				highlight = {
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
					"RainbowDelimiterRed",
				},
			}
		end,
	},
}
