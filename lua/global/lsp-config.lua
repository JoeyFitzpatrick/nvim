local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "<leader>le", function()
		vim.diagnostic.open_float()
	end)
	vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Lsp Restart" })
	vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "Lsp Info" })
	vim.keymap.set("n", "<leader>la", function()
		vim.lsp.buf.code_action()
	end, { desc = "Lsp Code Action" })
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, { desc = "Lsp Rename" })
	vim.keymap.set("n", "<leader>ic", function()
		vim.lsp.buf.incoming_calls()
	end)
	vim.keymap.set("n", "<leader>oc", function()
		vim.lsp.buf.outgoing_calls()
	end)
end)

local servers = {
	"pyright",
	"svelte",
	"lua_ls",
	"eslint",
}
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = servers,
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			-- (Optional) Configure lua language server for neovim
			local lua_opts = lsp_zero.nvim_lua_ls()
			lua_opts.settings.Lua.workspace.library = vim.api.nvim_get_runtime_file("lua", true)
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
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
local cmp_format = require("lsp-zero").cmp_format({})

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "copilot", group_index = 2 },
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
	formatting = cmp_format,
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
