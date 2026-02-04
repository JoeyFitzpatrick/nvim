return {
	{
		"johmsalas/text-case.nvim",
		config = function()
			require("textcase").setup({})
		end,
		cmd = "Subs",
		keys = { "ga" },
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
	{ "kylechui/nvim-surround", event = "VeryLazy", config = true },
	{ "nvim-tree/nvim-web-devicons", opts = {} },
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
	{
		"jiaoshijie/undotree",
		---@module 'undotree.collector'
		---@type UndoTreeCollector.Opts
		config = function()
			local undotree = require("undotree")
			undotree.setup({ window = { winblend = 0 } })
			vim.keymap.set("n", "<leader>u", function()
				undotree.toggle()
			end)
		end,
	},
	{ "rhysd/clever-f.vim", event = "BufEnter" },
}
