return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
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
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		version = "v0.*",
		build = "cargo build --release",
		opts = {
			appearance = {
				-- sets the fallback highlight groups to nvim-cmp's highlight groups
				-- useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release, assuming themes add support
				use_nvim_cmp_as_default = false,
				-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},
			completion = {
				list = {
					selection = "auto_insert",
				},
				accept = {
					-- experimental auto-brackets support
					auto_brackets = {
						enabled = true,
					},
				},
				menu = {
					draw = {
						treesitter = { "lsp" },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
				},
				ghost_text = {
					enabled = vim.g.ai_cmp,
				},
			},

			-- experimental signature help support
			-- signature = { enabled = true },

			sources = {
				-- adding any nvim-cmp sources here will enable them
				-- with blink.compat
				compat = {},
				default = { "lsp", "path", "snippets", "buffer" },
				cmdline = {},
			},

			keymap = {
				preset = "enter",
				["<C-y>"] = { "select_and_accept" },
			},
		},
	},
}
