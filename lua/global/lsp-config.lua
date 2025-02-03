vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set(
			"n",
			"<leader>ls",
			vim.lsp.buf.signature_help,
			{ buffer = event.buf, desc = "LSP Signature Help" }
		)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP Rename" })
		vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { buffer = event.buf, desc = "Open Error" })
		vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Lsp Restart" })
		vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Lsp Code Action" })
		-- vim.keymap.set("n", "<leader>ic", vim.lsp.buf.incoming_calls)
		-- vim.keymap.set("n", "<leader>oc", vim.lsp.buf.outgoing_calls)
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references)
	end,
})

require("lspconfig").basedpyright.setup({
	settings = {
		basedpyright = {
			analysis = {
				useLibraryCodeForTypes = true,
				typeCheckingMode = "standard",
			},
		},
	},
})
require("lspconfig").lua_ls.setup({})
require("lspconfig").ts_ls.setup({})
