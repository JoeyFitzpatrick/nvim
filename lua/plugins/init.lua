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
		opts = { cmap = false },
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
	{
		"gbprod/yanky.nvim",
		dependencies = { { "kkharji/sqlite.lua" } },
		opts = { ring = { storage = "sqlite" }, highlight = { timer = 150, on_put = false } },
		config = function(_, opts)
			require("yanky").setup(opts)
			vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
			vim.keymap.set("n", "<leader>rh", "<cmd>YankyRingHistory<cr>", { desc = "Open Yank History" })
			vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", { desc = "Yanky Put After" })
			vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", { desc = "Yanky Put After" })
			vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)", { desc = "Yanky GPut After" })
			vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)", { desc = "Yanky GPut After" })
			vim.keymap.set("n", "<c-m-p>", "<Plug>(YankyPreviousEntry)")
			vim.keymap.set("n", "<c-m-n>", "<Plug>(YankyNextEntry)")
		end,
	},
	{ "kylechui/nvim-surround", event = "VeryLazy", config = true },
	{ "nvim-tree/nvim-web-devicons", opts = {} },
}
