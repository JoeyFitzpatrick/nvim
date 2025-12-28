local M = {}

M.snippets = {
	all = {
		["{"] = "{\n\t$0\n}",
	},
	lua = {
		desc = 'describe("${1:description}", function()\n\t$0\nend)',
		fn = "function($1)\n\t$0\nend",
		it = 'it("${1:description}", function()\n\t$0\nend)',
		mod = "local M = {}\n\n$0\n\nreturn M",
		req = 'require("$0")',
	},
	htmldjango = {
		b = "{% block $1 %}\n\t$2\n{% endblock %}",
	},
	javascript = {
		desc = 'describe("${1:description}", () => {\n\t$0\n});',
		it = 'it("${1:description}", () => {\n\t$0\n});',
		logn = 'console.log("\\n\\n", $0, "\\n\\n")',
		["if"] = "if ($1) {\n\t$0\n}",
	},
	java = {
		["if"] = "if ($1) {\n\t$0\n}",
	},
	python = {
		pr = "print('\\n\\n '$0' \\n\\n')",
	},
}

-- Extend filetypes (typescript variants use javascript snippets)
M.snippets.typescript = M.snippets.javascript
M.snippets.typescriptreact = M.snippets.javascript
M.snippets.javascriptreact = M.snippets.javascript

local function get_snippets()
	local ft = vim.bo.filetype
	local result = vim.tbl_extend("force", M.snippets.all or {}, M.snippets[ft] or {})
	return result
end

-- Check if a snippet exists and expand it
local function try_expand_snippet()
	local line = vim.api.nvim_get_current_line()
	local col = vim.api.nvim_win_get_cursor(0)[2]
	local before_cursor = line:sub(1, col)

	-- Get the word before cursor
	local trigger = before_cursor:match("(%S+)$")
	if not trigger then
		return false
	end

	local snippets = get_snippets()
	local snippet_text = snippets[trigger]

	if snippet_text then
		-- Delete the trigger text
		local start_col = col - #trigger
		vim.api.nvim_buf_set_text(0, vim.fn.line(".") - 1, start_col, vim.fn.line(".") - 1, col, {})
		vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), start_col })

		vim.snippet.expand(snippet_text)
		return true
	end

	return false
end

vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if vim.snippet.active({ direction = 1 }) then
		vim.snippet.jump(1)
	elseif not try_expand_snippet() then
	end
end, { silent = true, desc = "Expand snippet or jump forward" })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if vim.snippet.active({ direction = -1 }) then
		vim.snippet.jump(-1)
	end
end, { silent = true, desc = "Jump backward in snippet" })

return M
