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
		{
			name = "nvim_lsp",
			group_index = 1,
			entry_filter = function(entry)
				return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
			end,
		},
		{ name = "luasnip", group_index = 2 },
	}),
	mapping = {
		["<C-y>"] = cmp.mapping.confirm(),
		["<C-n>"] = function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			else
				cmp.complete()
			end
		end,
		["<up>"] = function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			else
				cmp.complete()
			end
		end,
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<down>"] = cmp.mapping.select_prev_item(),
		-- scroll up and down the documentation window
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
	},
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
})

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
