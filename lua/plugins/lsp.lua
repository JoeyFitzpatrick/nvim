local typescript_filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" }

return {
	{ "dmmulroy/tsc.nvim", event = "VeryLazy", opts = { bin_name = "tsgo" } },
	{ "neovim/nvim-lspconfig", lazy = false },
	{
		"dmmulroy/ts-error-translator.nvim",
		ft = typescript_filetypes,
		config = true,
	},
	{ "https://github.com/enochchau/nvim-pretty-ts-errors", ft = typescript_filetypes },
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
