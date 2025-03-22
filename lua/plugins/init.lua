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
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {},
	},
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "tabs",
					always_show_bufferline = false,
				},
			})
		end,
	},
	{
		"mistweaverco/kulala.nvim",
		keys = {
			{ "<leader>Rs", desc = "Send request" },
			{ "<leader>Ra", desc = "Send all requests" },
			{ "<leader>Rb", desc = "Open scratchpad" },
		},
		ft = { "http", "rest" },
		opts = {
			-- your configuration comes here
			global_keymaps = false,
		},
	},
	{ "rhysd/clever-f.vim", event = "BufEnter" },
}
