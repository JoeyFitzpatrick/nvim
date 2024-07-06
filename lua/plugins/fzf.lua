return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
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
		vim.keymap.set("n", "gr", fzf.lsp_references, { noremap = true, silent = true })
		vim.keymap.set("n", "gd", fzf.lsp_definitions, { noremap = true, silent = true })
		nmap("<leader><leader>g", fzf.resume)
		nmap("<leader>n", ":FzfLua ")
		fzf.register_ui_select()
	end,
}
