return {
	{ "neovim/nvim-lspconfig", event = "VeryLazy" },
	-- other lsp plugins
	{
		"dmmulroy/ts-error-translator.nvim",
		ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		config = true,
	},
	{
		"danymat/neogen",
		version = "*",
		config = function()
			require("neogen").setup({})
			Nmap(
				"<Leader>lg",
				":lua require('neogen').generate()<CR>",
				"Generate annotation",
				{ noremap = true, silent = true }
			)
		end,
	},
	{
		"yioneko/nvim-vtsls",
		ft = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
		config = function()
			vim.lsp.config.vtsls = require("vtsls").lspconfig
			vim.lsp.enable("vtsls")
			vim.keymap.set("n", "<leader>ts", ":VtsExec", { desc = "Execute vtsls command" })
		end,
	},
}
