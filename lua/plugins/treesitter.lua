return {
	-- {
	-- 	"nvim-treesitter/nvim-treesitter",
	-- 	build = ":TSUpdate",
	-- 	branch = "master",
	-- 	event = "BufEnter",
	-- 	config = function()
	-- 		require("nvim-treesitter.configs").setup({
	-- 			ensure_installed = {
	-- 				"lua",
	-- 				"vim",
	-- 				"vimdoc",
	-- 				"query",
	-- 				"html",
	-- 				"python",
	-- 				"typescript",
	-- 				"tsx",
	-- 				"javascript",
	-- 				"styled", -- support for styled component highlighting
	-- 			},
	-- 			ignore_install = {},
	-- 			modules = {},
	-- 			sync_install = false,
	-- 			auto_install = true,
	-- 			highlight = { enable = true },
	-- 			indent = { enable = true },
	-- 			incremental_selection = {
	-- 				enable = true,
	-- 				keymaps = {
	-- 					init_selection = "<Enter>",
	-- 					node_incremental = "<Enter>",
	-- 					node_decremental = "<BS>",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-treesitter/nvim-treesitter",
		-- build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		init = function()
			local ts_ensure_installed = {
				"bash",
				"c",
				"css",
				"diff",
				"go",
				"html",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"vim",
				"vimdoc",
			}

			-- Install parsers and register them for filetypes
			require("nvim-treesitter").install(ts_ensure_installed)
			for _, parser in ipairs(ts_ensure_installed) do
				vim.treesitter.language.register(parser, parser)
				vim.api.nvim_create_autocmd("FileType", {
					pattern = parser,
					callback = function(event)
						vim.treesitter.start(event.buf, parser)
					end,
				})
			end

			-- Auto-install and start parsers for any buffer not in the list above
			vim.api.nvim_create_autocmd("BufRead", {
				callback = function(event)
					local bufnr = event.buf
					local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })

					if filetype == "" then
						return
					end

					-- Skip if already handled by ts_ensure_installed
					if vim.tbl_contains(ts_ensure_installed, filetype) then
						return
					end

					local parser_name = vim.treesitter.language.get_lang(filetype)
					if not parser_name then
						return
					end

					local parser_configs = require("nvim-treesitter.parsers")
					if not parser_configs[parser_name] then
						return
					end

					local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

					if not parser_installed then
						require("nvim-treesitter").install({ parser_name }):wait(30000)
					end

					parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)

					if parser_installed then
						vim.treesitter.start(bufnr, parser_name)
					end
				end,
			})
		end,
		opts = {
			install = {
				"css",
				"comment",
				"markdown",
				"markdown_inline",
				"regex",
				"vimdoc",
			},
		},
		config = function(_, opts)
			local treesitter = require("nvim-treesitter")
			treesitter.setup(opts)
			if vim.fn.executable("tree-sitter") ~= 1 then
				vim.api.nvim_echo({
					{
						"tree-sitter CLI not found. Parsers cannot be installed.",
						"ErrorMsg",
					},
				}, true, {})
				return false
			end
			-- treesitter.install(opts.install)
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
	{ "folke/ts-comments.nvim", enabled = false, opts = {}, event = "VeryLazy" },
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
				vim.cmd("TSContext toggle")
			end, { silent = true, desc = "Toggle treesitter context" })
		end,
	},
}
