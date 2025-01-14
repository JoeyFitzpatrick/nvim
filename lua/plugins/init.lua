local set = vim.keymap.set

return {
	{
		"AckslD/nvim-neoclip.lua",
		event = "VeryLazy",
		dependencies = {
			"ibhagwan/fzf-lua",
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
		config = function()
			require("neoclip").setup()
			set("n", "<leader>tn", function()
				require("neoclip.fzf")()
			end, { silent = true })
		end,
	},
	{
		"johmsalas/text-case.nvim",
		config = function()
			require("textcase").setup({})
		end,
		cmd = "Subs",
		keys = { "ga" },
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", { silent = true, desc = "Undo Tree" } },
		},
	},
	{
		"christoomey/vim-tmux-navigator",
		event = "VeryLazy",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			-- { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
		config = function()
			set("n", "<c-h>", function()
				local column = vim.api.nvim_win_get_position(0)[2]
				if column == 0 then
					vim.cmd("wincmd h")
				else
					vim.cmd("TmuxNavigateLeft")
				end
			end)
		end,
	},
	{
		"haya14busa/vim-asterisk",
		event = "VeryLazy",
		config = function()
			vim.cmd([[
                            map *  <Plug>(asterisk-z*)
                            map #  <Plug>(asterisk-z#)
                            map g* <Plug>(asterisk-gz*)
                            map g# <Plug>(asterisk-gz#)
                            let g:asterisk#keeppos = 1
                        ]])
		end,
	},
	{ "brenoprata10/nvim-highlight-colors", config = true, event = "BufEnter" },
	{
		"lervag/vimtex",
		enabled = false,
		lazy = false, -- we don't want to lazy load VimTeX
		init = function()
			vim.g.vimtex_view_method = "skim"
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.cmd([[Lazy load markdown-preview.nvim]])
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"otavioschwanck/arrow.nvim",
		config = function()
			require("arrow").setup({
				show_icons = true,
				leader_key = ",",
			})
			vim.keymap.set("n", "H", require("arrow.persist").previous)
			vim.keymap.set("n", "L", require("arrow.persist").next)
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
}
