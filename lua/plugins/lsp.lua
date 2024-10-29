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

		-- use a release tag to download pre-built binaries
		version = "v0.*",
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		opts = {
			keymap = {
				show = "<C-l>",
				hide = {},
				accept = "<C-y>",
				select_prev = { "<Up>", "<C-p>" },
				select_next = { "<Down>", "<C-n>" },
				show_documentation = {},
				hide_documentation = {},
				scroll_documentation_up = "<C-b>",
				scroll_documentation_down = "<C-f>",

				snippet_forward = {},
				snippet_backward = {},
			},
			highlight = {
				-- sets the fallback highlight groups to nvim-cmp's highlight groups
				-- useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release, assuming themes add support
				use_nvim_cmp_as_default = true,
			},
			sources = {
				completion = {
					enabled_providers = { "lsp", "path" },
				},
			},
			nerd_font_variant = "normal",
			windows = {
				autocomplete = {
					selection = "auto_insert",
				},
				documentation = {
					auto_show = true,
				},
			},

			-- experimental auto-brackets support
			-- accept = { auto_brackets = { enabled = true } }

			-- experimental signature help support
			-- trigger = { signature_help = { enabled = true } }
		},
	},
}
