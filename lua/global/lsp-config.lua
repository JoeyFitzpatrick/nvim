vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float)
		vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Lsp Restart" })
		vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Lsp Code Action" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Lsp Rename" })
		vim.keymap.set("n", "<leader>ic", vim.lsp.buf.incoming_calls)
		vim.keymap.set("n", "<leader>oc", vim.lsp.buf.outgoing_calls)
	end,
})

local servers = {
	"pyright",
	"svelte",
	"lua_ls",
	"eslint",
}

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
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

local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "luasnip", group_index = 3 },
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),
	mapping = {
		["<C-h>"] = cmp.mapping.complete(),
		-- scroll up and down the documentation window
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	},
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
})

-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })

-- `/` cmdline setup.
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})
