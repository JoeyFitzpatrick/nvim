local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets("lua", {
	s("fn", {
		t({ "function(" }),
		i(1),
		t({ ")", "\t" }),
		i(0),
		t({ "", "end" }),
	}),
	s("mod", {
		t({ "local M = {}", "", "" }),
		i(0),
		t({ "", "", "return M" }),
	}),
	s("desc", {
		t('describe("'),
		i(1, "description"),
		t({ '", function()', "\t" }),
		i(0),
		t({ "", "end)" }),
	}),
	s("it", {
		t('it("'),
		i(1, "description"),
		t({ '", function()', "\t" }),
		i(0),
		t({ "", "end)" }),
	}),
})

ls.add_snippets("htmldjango", {
	s("b", {
		t("{% block "),
		i(1),
		t({ " %}", "\t" }),
		i(2),
		t({ "", "{% endblock %}" }),
	}),
})

ls.filetype_extend("typescript", { "javascript" })
ls.filetype_extend("typescriptreact", { "javascript" })
ls.filetype_extend("javascriptreact", { "javascript" })

ls.add_snippets("javascript", {
	s(
		-- example of a snippet with filename
		"fi",
		{
			t("export function "),
			f(function(args, snip)
				local env = snip.env
				return env.TM_FILENAME:match("^[^.]*")
			end, {}),
			t("("),
			i(1, "args"),
			t({ ") {", "\t", "}" }),
		}
	),
	s("desc", {
		t('describe("'),
		i(1, "description"),
		t({ '", () => {', "\t" }),
		i(0),
		t({ "", "});" }),
	}),
	s("it", {
		t('it("'),
		i(1, "description"),
		t({ '", () => {', "\t" }),
		i(0),
		t({ "", "});" }),
	}),
	s("logn", {
		t('console.log("\\n\\n", '),
		i(0),
		t(', "\\n\\n")'),
	}),
})

ls.add_snippets("rust", {
	s("pr", {
		t('println!("{'),
		i(0),
		t('}");'),
	}),
})

ls.add_snippets("python", {
	s("pr", {
		t("print('\\n\\n '"),
		i(0),
		t("' \\n\\n')"),
	}),
})

Nmap("<leader><leader>s", function()
	ls.cleanup()
	vim.cmd("source ~/.config/nvim/lua/global/snippets/init.lua")
	vim.print("Snippets reloaded")
end, "reload snippets")

vim.keymap.set({ "i" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })
-- vim.keymap.set({ "i", "s" }, "<C-L>", function()
-- 	ls.jump(1)
-- end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
	ls.jump(-1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true })
