vim.g.mapleader = " "

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_disable_netrw = 0

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nmap = function(lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set("n", lhs, rhs, opts)
end

require("config.lazy")

require("global.set")
require("global.remap")
require("global.autocmd")
require("global.lsp-config")
require("global.snippets")
require("global.utils")
require("global.helpers.tmux")
vim.keymap.set("n", "<leader>tt", function()
	vim.ui.input({ prompt = "Enter a command: " }, function(cmd)
		local bufnr = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_call(bufnr, function()
			vim.fn.termopen(cmd, {
				on_exit = function()
					vim.api.nvim_set_option_value("modifiable", false, { buf = bufnr })
					vim.cmd(string.format([[silent! %dwindo wincmd p]], bufnr))
				end,
			})
		end)
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = bufnr })
		-- vim.keymap.set({ "n", "t" }, "j", function()
		-- 	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("ij<esc>", true, false, true), "n", true)
		-- end, { buffer = bufnr })
		-- vim.keymap.set({ "n", "t" }, "k", function()
		-- 	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("ik<esc>", true, false, true), "n", true)
		-- end, { buffer = bufnr })
		vim.cmd("bo vsplit")
		vim.api.nvim_set_current_buf(bufnr)
	end)
end)
