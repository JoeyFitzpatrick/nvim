return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"yioneko/nvim-cmp",
		branch = "perf",
		opts = {
			performance = {
				debounce = 0,
				throttle = 0,
			},
			sources = {
				{ "cmp-dbee" },
			},
		},
		dependencies = {
			{
				"MattiasMTS/cmp-dbee",
				dependencies = {
					{
						"kndndrj/nvim-dbee",
						dependencies = {
							"MunifTanjim/nui.nvim",
						},
						build = function()
							-- Install tries to automatically detect the install method.
							-- if it fails, try calling it with one of these parameters:
							--    "curl", "wget", "bitsadmin", "go"
							require("dbee").install()
						end,
						config = function()
							require("dbee").setup({
								sources = {
									-- require("dbee.sources").MemorySource:new({
									-- 	{
									-- 		id = "josephfitzpatrick1",
									-- 		name = "josephfitzpatrick",
									-- 		type = "postgres",
									-- 		url = "postgres://josephfitzpatrick:cloudatlas@localhost:5432/josephfitzpatrick?sslmode=disable",
									-- 	},
									-- }),
									require("dbee.sources").MemorySource:new({
										{
											id = "nba1",
											name = "nba",
											type = "postgres",
											url = "postgres://josephfitzpatrick:cloudatlas@localhost:5432/nba?sslmode=disable",
										},
									}),
								},
							})
							nmap("do", function()
								require("dbee").toggle()
							end, "Toggle dbee")
						end,
					},
				},
				ft = "sql", -- optional but good to have
				opts = {}, -- needed
			},
		},
	},
	{
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
			config = function()
				local types = require("luasnip.util.types")
				require("luasnip").setup({
					keep_roots = true,
					link_roots = true,
					link_children = true,
					update_events = { "TextChanged", "TextChangedI" },
					delete_check_events = "TextChanged",
					ext_opts = {
						[types.choiceNode] = {
							active = {
								virt_text = { { "choiceNode", "Comment" } },
							},
						},
					},
				})
			end,
		},
	},
	-- other lsp plugins
	{
		"pmizio/typescript-tools.nvim",
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		-- keys = {
		-- 	{ "gd", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to source definition" },
		-- 	{ "<leader>ts", "<cmd>TSTools<cr>", desc = "Typescript tools" },
		-- },
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("typescript-tools").setup({
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<leader>ts", ":TSTools", { noremap = true, silent = false })
					vim.keymap.set("n", "gd", "<cmd>TSToolsGoToSourceDefinition<cr>", { noremap = true, silent = true })
					-- can't get workspace diagnostics working :(
					-- Here's an article that could help: https://artem.rocks/posts/workspace_diagnostics_nvim
					-- local files = require("global.utils").workspace_files
					-- require("global.utils").trigger_workspace_diagnostics(client, bufnr, files)
				end,
			})
		end,
		opts = {},
	},
	{
		"dmmulroy/tsc.nvim",
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		config = true,
		cmd = "TSC",
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{ "<leader>ld", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics" },
			{ "<leader>lw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace Diagnostics" },
			{
				"<leader>ll",
				"<cmd>Trouble lsp toggle focus=false win.position=left<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
		},
	},
	{
		"danymat/neogen",
		version = "*",
		config = function()
			require("neogen").setup({})
			nmap(
				"<Leader>lg",
				":lua require('neogen').generate()<CR>",
				"Generate annotation",
				{ noremap = true, silent = true }
			)
		end,
	},
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = true,
		-- event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{ "LuaCATS/luassert", name = "luassert-types", lazy = true },
	{ "LuaCATS/busted", name = "busted-types", lazy = true },
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "luassert-types/library" },
				{ path = "busted-types/library" },
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
	{
		{ -- optional completion source for require statements and module annotations
			"yioneko/nvim-cmp",
			opts = function(_, opts)
				opts.sources = opts.sources or {}
				table.insert(opts.sources, {
					name = "lazydev",
					group_index = 0, -- set group index to 0 to skip loading LuaLS completions
				})
			end,
		},
	},
}
