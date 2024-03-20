local set = vim.keymap.set

return {
	{ "tpope/vim-surround", event = "VeryLazy" },
	{ "tpope/vim-commentary", event = "VeryLazy" },
	{ "tpope/vim-sleuth", event = "VeryLazy" },
	{ "rhysd/clever-f.vim", event = "BufEnter" },
	{ "kevinhwang91/nvim-bqf", ft = "qf" },
	{ "hrsh7th/cmp-cmdline", event = "VeryLazy" },
	{ "girishji/fFtT.vim", event = "VeryLazy" },
	{ "folke/neodev.nvim", opts = {} },
	{ "nvim-lualine/lualine.nvim", config = true, dependencies = { "nvim-tree/nvim-web-devicons" } },
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = "BufEnter",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "BufEnter",
		opts = { indent = { char = { "│" } } },
	},
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
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme tokyonight-moon")
			function light()
				vim.cmd("set background=light | colorscheme tokyonight-day")
			end
			function dark()
				vim.cmd("set background=dark | colorscheme tokyonight-moon")
			end
			vim.cmd("command Light silent lua light()")
			vim.cmd("command Dark silent lua dark()")
		end,
	},
	{
		"chentoast/marks.nvim",
		keys = { "m" },
		config = function()
			require("marks").setup({
				mappings = {
					next = "<A-m>",
					prev = "<A-M>",
				},
			})
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
		"nvim-pack/nvim-spectre",
		build = false,
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = {
			{
				"<leader>sr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in files (Spectre)",
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
		"luckasRanarison/nvim-devdocs",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			previewer_cmd = "glow",
			cmd_args = { "-s", "dark", "-w", "80" },
		},
		keys = {
			{ "<leader>td", "<cmd>DevdocsOpenCurrentFloat<CR>", desc = "Open Devdocs for current file type" },
			{ "<leader>tD", "<cmd>DevdocsOpenFloat<CR>", desc = "Open Devdocs for any file type" },
		},
		cmd = {
			"DevdocsFetch",
			"DevdocsInstall",
			"DevdocsUninstall",
			"DevdocsOpen",
			"DevdocsOpenCurrent",
			"DevdocsUpdateAll",
		},
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
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				routes = {
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},
					{
						view = "notify",
						filter = { event = "msg_showmode" },
					},
				},
			})
		end,
	},
}
