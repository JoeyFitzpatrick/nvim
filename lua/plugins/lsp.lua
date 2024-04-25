return {
	-- lsp-zero plugins
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
	},
	{ "saadparwaiz1/cmp_luasnip" },

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
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		keys = {
			{ "<leader>ld", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics" },
			{ "<leader>lw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
		},
	},
}
