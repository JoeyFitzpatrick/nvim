local lsp = require("lsp-zero")
require("lspconfig.configs").vtsls = require("vtsls").lspconfig
vim.lsp.set_log_level("debug")

local opts = {silent = true, noremap = true}
vim.keymap.set("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

lsp.preset({
	name = "minimal",
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

local servers = {
	"pyright",
	"svelte",
	"rust_analyzer",
	"lua_ls",
	"eslint",
}

-- More servers can be found here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
lsp.ensure_installed(servers)

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({
		buffer = bufnr,
		preserve_mappings = false,
	})
end)

local lspconfig = require("lspconfig")
-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

-- More servers can be found here: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
lsp.setup_servers(servers)


lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	vim.keymap.set("n", "<leader>ho", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	-- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set({ "n", "x", "v" }, "<leader>F", function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, opts)
	vim.keymap.set("n", "<leader>ic", function()
		vim.lsp.buf.incoming_calls()
	end, opts)
	vim.keymap.set("n", "<leader>oc", function()
		vim.lsp.buf.outgoing_calls()
	end, opts)
end)

vim.diagnostic.config({
	update_in_insert = true,
	underline = true,
	severity_sort = true,
})

lsp.nvim_workspace()

lsp.setup()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = require("lsp-zero").cmp_action()

require("luasnip.loaders.from_snipmate").lazy_load()

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<Enter>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

local cmp_sources = {
	{ name = "nvim_lsp" },
	-- { name = "luasnip" },
	{ name = "cmp_luasnip" },
}

cmp.setup({
	mapping = cmp_mappings,
	sources = cmp_sources,
})

require("sonarlint").setup({
	server = {
		cmd = {
			"sonarlint-language-server",
			-- Ensure that sonarlint-language-server uses stdio channel
			"-stdio",
			"-analyzers",
			-- paths to the analyzers you need, using those for python and java in this example
			vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
			vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
			vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
		},
	},
	filetypes = {
		-- Tested and working
		"python",
		"cpp",
		-- Requires nvim-jdtls, otherwise an error message will be printed
		"java",
	},
})

require("helpers.linters")
