local set = vim.keymap.set

return {
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-commentary", event = "VeryLazy" },
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{ "hrsh7th/cmp-cmdline", event = "VeryLazy" },
	{
		"AckslD/nvim-neoclip.lua",
		event = "VeryLazy",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			{ "kkharji/sqlite.lua", module = "sqlite" },
		},
		config = function()
			set("n", "<leader>tn", "<cmd>Telescope neoclip<CR>", { silent = true })
			require("neoclip").setup()
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa")
			function light()
				vim.cmd("set background=light | colorscheme kanagawa-lotus")
			end
			function dark()
				vim.cmd("set background=dark | colorscheme kanagawa-wave")
			end
			vim.cmd("command Light silent lua light()")
			vim.cmd("command Dark silent lua dark()")
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({
				view = { width = {} },
				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					update_root = false,
				},
				filters = {
					git_ignored = false,
					custom = { "node_modules" },
				},
			})
			set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { silent = true })
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		event = "VeryLazy",
		config = function()
			vim.g.lazygit_floating_window_scaling_factor = 1
			set("n", "<leader>j", "<cmd>LazyGit<CR>", { silent = true })
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6",
		opts = {
			fastwarp = {
				multi = true,
				{},
				{
					enable_normal = true,
					enable_reverse = true,
					faster = false,
					map = "<C-a>",
					rmap = "<C-s>",
					cmap = "<C-a>",
					rcmap = "<C-s>",
				},
			},
		},
	},
	{
		"johmsalas/text-case.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("textcase").setup({})
			require("telescope").load_extension("textcase")
		end,
		cmd = "Subs",
		keys = {
			"ga", -- Default invocation prefix
			{ "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
		},
	},
	{
		"mbbill/undotree",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<CR>", { silent = true, desc = "Undo Tree" } },
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 500
		end,
		opts = {},
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
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufEnter",
		config = function()
			require("todo-comments").setup({})
			nmap("<leader>lt", "<cmd>TodoTrouble<CR>", "Todos")
		end,
	},
}
