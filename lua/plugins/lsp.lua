return {
	{ "dmmulroy/tsc.nvim", event = "VeryLazy", opts = { bin_name = "tsgo" } },
	{ "neovim/nvim-lspconfig", lazy = false },
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
}
