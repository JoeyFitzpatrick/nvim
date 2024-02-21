return {
	-- lsp-zero plugins
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "L3MON4D3/LuaSnip" },

	-- other lsp plugins
	{
		"pmizio/typescript-tools.nvim",
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
	{ "dmmulroy/tsc.nvim", config = true, cmd = "TSC" },
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>ld", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics" },
			{ "<leader>lw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
		},
	},
}
