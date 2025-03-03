return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"query",
					"html",
					"python",
					"typescript",
					"tsx",
					"javascript",
					"styled", -- support for styled component highlighting
				},
				ignore_install = {},
				modules = {},
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<Enter>",
						node_incremental = "<Enter>",
						node_decremental = "<BS>",
					},
				},
			})
			-- folding config
			vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
			vim.opt.foldcolumn = "0"
			vim.opt.foldtext = ""
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 1
			vim.opt.foldnestmax = 4
		end,
	},
	{
		"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
		config = function()
			---@type rainbow_delimiters.config
			vim.g.rainbow_delimiters = {
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterBlue",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
			})
		end,
	},
	{ "folke/ts-comments.nvim", opts = {}, event = "VeryLazy" },
	{ "nvim-treesitter/nvim-treesitter-textobjects", event = "VeryLazy" },
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		config = function()
			require("treesitter-context").setup({
				enable = false, -- off by default, turn on with command
			})
			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end, { silent = true, desc = "Navigate to parent context" })
			vim.keymap.set("n", "<leader>lc", function()
				vim.cmd("TSContextToggle")
			end, { silent = true, desc = "Toggle treesitter context" })
		end,
	},
}
