return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			winopts = {
				height = 0.95,
				width = 0.95, -- window width
				row = 0.35, -- window row position (0=top, 1=bottom)
				col = 0.50,
			},
			keymap = {
				fzf = {
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
		nmap("<leader>g", fzf.live_grep_glob)
		vim.keymap.set("v", "<leader>g", fzf.grep_visual, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>f", fzf.files, { noremap = true, silent = true })
		-- vim.keymap.set("n", "<leader>f", function()
		-- 	fzf.files({ cmd = "rg --no-config --files --sortr=modified" })
		-- end, { noremap = true, silent = true })
		vim.keymap.set("n", "gr", fzf.lsp_references, { noremap = true, silent = true })
		vim.keymap.set("n", "gd", fzf.lsp_definitions, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>th", fzf.helptags, {})
		vim.keymap.set("n", "<leader>dg", fzf.diagnostics_workspace, {})

		vim.keymap.set("n", "<leader>ep", function()
			fzf.files({ cwd = "~/.local/share/nvim/lazy" })
		end, {})
		nmap("<leader>ds", fzf.lsp_document_symbols, "[D]ocument [S]ymbols")
		nmap("<leader><leader>g", fzf.resume)
		nmap("<leader>n", ":FzfLua ")
		fzf.register_ui_select()
	end,
}
