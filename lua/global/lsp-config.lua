vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float)
		vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Lsp Restart" })
		vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Lsp Code Action" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Lsp Rename" })
		vim.keymap.set("n", "<leader>ic", vim.lsp.buf.incoming_calls)
		vim.keymap.set("n", "<leader>oc", vim.lsp.buf.outgoing_calls)
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		-- vim.keymap.set("n", "gr", vim.lsp.buf.references)
	end,
})

local servers = {
	"pyright",
	"svelte",
	"lua_ls",
	"eslint",
}

local lsp_capabilities = {
	textDocument = {
		completion = {
			completionItem = {
				commitCharactersSupport = true,
				deprecatedSupport = true,
				insertReplaceSupport = true,
				insertTextModeSupport = {
					valueSet = { 1, 2 },
				},
				labelDetailsSupport = true,
				preselectSupport = true,
				resolveSupport = {
					properties = {
						"documentation",
						"detail",
						"additionalTextEdits",
						"sortText",
						"filterText",
						"insertText",
						"textEdit",
						"insertTextFormat",
						"insertTextMode",
					},
				},
				snippetSupport = true,
				tagSupport = {
					valueSet = { 1 },
				},
			},
			completionList = {
				itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" },
			},
			contextSupport = true,
			dynamicRegistration = false,
			insertTextMode = 1,
		},
	},
}
local default_setup = function(server)
	require("lspconfig")[server].setup({
		capabilities = lsp_capabilities,
	})
end

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = servers,
	handlers = {
		default_setup,
		eslint = function()
			-- Docs for this setup is here: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
			require("lspconfig").eslint.setup({
				rulesCustomizations = {
					rule = "prettier/prettier",
					severity = "off",
				},
			})
		end,
	},
})
