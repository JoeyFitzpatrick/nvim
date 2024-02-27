local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "<leader>e", function()
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
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md

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
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
		eslint = function()
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
local cmp_format = require("lsp-zero").cmp_format()

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	mapping = {
		["<C-k>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
		["<C-j>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item({ behavior = "insert" })
			else
				cmp.complete()
			end
		end),
		["<Enter>"] = cmp.mapping.confirm({ select = true }),
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

require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
