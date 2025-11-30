vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Lsp Restart" })
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })

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
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { buffer = event.buf, desc = "Lsp Code Action" })

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})

vim.lsp.config("pyrefly", { cmd = { "uvx", "pyrefly", "lsp" }, filetypes = { "python" } })

vim.lsp.config("ocamllsp", {
	cmd = { "ocamllsp" },
	filetypes = {
		"ocaml",
		"ocaml.interface",
		"ocaml.menhir",
		"ocaml.ocamllex",
		"dune",
		"reason",
	},
	root_markers = {
		{ "dune-project", "dune-workspace" },
		{ "*.opam", "esy.json", "package.json" },
		".git",
	},
	settings = {},
})

vim.lsp.enable({
	"bashls",
	"gopls",
	"emmylua_ls",
	"ocamllsp",
	"pyrefly",
	"ruff",
	"yamlls",
	"zls",
})
