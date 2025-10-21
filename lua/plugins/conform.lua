return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		-- -- speed up eslint
		-- conform.formatters.eslint_d = {
		-- 	cmd = "eslint_d",
		-- 	args = { "--fix", "--cache", vim.api.nvim_buf_get_name(0) },
		-- 	stdin = false,
		-- }

		conform.setup({
			formatters_by_ft = {
				-- Conform will run multiple formatters sequentially
				css = { "prettier" },
				htmldjango = { "djlint" },
				javascript = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				json = { "jq" },
				lua = { "stylua" },
				python = { "isort", "black", "pylint" },
				sql = { "sql_formatter" },
				svelte = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				vue = { "prettierd", "eslint_d" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n", "x", "v" }, "<C-f>", function()
			conform.format({ async = true, timeout_ms = 10000 })
		end, {})
	end,
}
