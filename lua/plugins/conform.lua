return {
	"stevearc/conform.nvim",
	opts = {},
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	config = function()
		local conform = require("conform")

		-- speed up eslint
		conform.formatters.eslint_d = {
			cmd = "eslint_d",
			args = { "--fix", "--cache", vim.api.nvim_buf_get_name(0) },
			stdin = false,
		}

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				javascript = { "prettierd", "eslint_d" },
				typescript = { "prettierd", "eslint_d" },
				javascriptreact = { "prettierd", "eslint_d" },
				typescriptreact = { "prettierd", "eslint_d" },
				css = { "prettier" },
				htmldjango = { "djlint" },
				svelte = { "prettierd", "eslint_d" },
				sql = { "sql_formatter" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
				-- use a filter to not format some file types on save
				filter = function()
					local filetype = vim.bo.filetype
					return filetype ~= "prisma"
				end,
			},
		})

		vim.keymap.set({ "n", "x", "v" }, "<C-f>", function()
			conform.format({ async = true, timeout_ms = 10000 })
		end, {})
	end,
}
