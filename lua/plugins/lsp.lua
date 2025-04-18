return {
	{ "neovim/nvim-lspconfig", event = "VeryLazy" },
	{
		"kndndrj/nvim-dbee",
		enabled = false,
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
				sources = {},
			})
			nmap("do", function()
				require("dbee").toggle()
			end, "Toggle dbee")
		end,
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
		"dmmulroy/tsc.nvim",
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		config = true,
		cmd = "TSC",
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		config = true,
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
	{ "LuaCATS/luassert", name = "luassert-types", lazy = true },
	{ "LuaCATS/busted", name = "busted-types", lazy = true },
	{ "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
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
	{
		"pmizio/typescript-tools.nvim",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
		config = function()
			require("typescript-tools").setup({
				settings = {
					tsserver_plugins = {
						"@styled/typescript-styled-plugin",
					},
				},
			})
			vim.keymap.set("n", "<leader>ts", ":TSTools", { desc = "Auto-populate partial TSTools command" })
		end,
	},
}
