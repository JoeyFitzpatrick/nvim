return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = "BufEnter",
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
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["ac"] = { query = "@class.outer", desc = "Select outer part of a class region" },
							["is"] = { query = "@scope.inner", desc = "Select inner part of a scope" },
							["as"] = { query = "@scope.outer", desc = "Select outer part of a scope" },
						},
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "V",
							["@scope.outer"] = "V",
							["@scope.inner"] = "v",
						},
						include_surrounding_whitespace = false,
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
		event = "BufEnter",
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
		event = "BufEnter",
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
