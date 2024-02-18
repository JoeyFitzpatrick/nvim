local opts = { silent = true, noremap = true }
local set = vim.keymap.set

-- Sick of pressing shift colon
set("n", ";", ":", { noremap = true })
set("v", ";", ":", { noremap = true })
set("n", ":", ";", { noremap = true })
set("v", ":", ";", { noremap = true })

-- Visual move lines
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Center screen after vertical navigation
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- Center screen after search
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Copy to clipboard
set("v", "<Leader>y", '"+y')
set("n", "<leader>Y", '"+yg_')
set("n", "<Leader>y", '"+y')
set("n", "<Leader>yy", '"+yy')

-- Paste from clipboard
set("n", "<Leader>p", '"+p')
set("n", "<leader>P", '"+P')
set("v", "<Leader>p", '"+p')
set("v", "<Leader>P", '"+P')

-- Cut to clipboard
set("n", "<leader>D", '""D')
set("v", "<Leader>d", '""d')
set("n", "<Leader>d", '""d')
set("n", "<Leader>dd", '""dd')

-- Delete and copy without yanking
set("n", "D", '"_D')
set("v", "d", '"_d')
set("n", "d", '"_d')
set("n", "dd", '"_dd')

set("n", "C", '"_C')
set("v", "c", '"_c')
set("n", "c", '"_c')
set("n", "cc", '"_cc')

-- Paste without yanking the pasted over text
set("v", "p", '"0p')
set("v", "P", '"0P')

-- Same thing for x
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })

-- Custom text objects
-- ie = inner entire buffer
set("o", "ie", ':exec "normal! ggVG"<cr>')

-- "A" in visual mode select around a text objext in visual line mode
local text_object_chars = {
	"(",
	")",
	"[",
	"]",
	"{",
	"}",
	"<",
	">",
	"'",
	'"',
	"`",
}
local operations = {
	"d",
	"y",
	"c",
}
for _, char in pairs(text_object_chars) do
	set("v", "A" .. char, "a" .. char .. "V", { remap = true })
	for _, op in pairs(operations) do
		local leader_op = "<leader>" .. op
		set("n", op .. "A" .. char, "<esc>vA" .. char .. op, { remap = true })
		set("n", leader_op .. "A" .. char, "<esc>vA" .. char .. leader_op, { remap = true })
	end
end

-- Remap for surround to avoid clashing with leap
set("v", "S", "<Plug>VSurround", { remap = false })

set("v", "y", "ygv<esc>", { remap = false })

-- Easier jumps to start/end of line
set({ "n", "v" }, "L", "$")
set({ "n", "v" }, "H", "_")

-- better navigation for wrapped lines
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Save with ctrl+w
set("n", "<C-w>", "<cmd>wa<CR>")
set("i", "<C-w>", "<esc><cmd>wa<CR>")

-- Quit with ctrl+q
set("n", "<c-q>", ":q<CR>", { noremap = true })

-- Tabs
set("n", "<Tab>", "gt")
set("n", "<S-Tab>", "gT")

set("n", "cn", ":cnext<cr>", opts)
set("n", "cp", ":cprev<cr> ", opts)
set("n", "<leader>q", function()
	require("helpers.quickfix").toggle_qf()
end, opts)

-- better window navigation. Install tmux navigator plugin if using tmux.
set("n", "<C-H>", "<C-W>h", { noremap = true })
set("n", "<C-J>", "<C-W>j", { noremap = true })
set("n", "<C-K>", "<C-W>k", { noremap = true })
set("n", "<C-L>", "<C-W>l", { noremap = true })

-- Set keybindings for quickfix window only
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "qf",
-- 	callback = function()
-- 		set("n", "q", ":q<CR>", { buffer = true })
-- 	end,
-- })
-- Create an autocmd for FileType with pattern "qf"
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		-- Undo the modified j and k keybindings in the quickfix window
		set("n", "j", "j", { buffer = true, noremap = true })
		set("n", "k", "k", { buffer = true, noremap = true })
		-- Set 'q' to close the quickfix window in normal mode
		set("n", "q", ":q<CR>", { buffer = true })
		-- Set 'dd' to remove an item from the quickfix list in normal mode
		set("n", "dd", function()
			local qf_idx = vim.fn.line(".") -- Get the current line number, which corresponds to the quickfix item index
			local qf_list = vim.fn.getqflist() -- Get the current quickfix list
			table.remove(qf_list, qf_idx)
			vim.fn.setqflist(qf_list)
		end, { buffer = true })
	end,
})

vim.cmd([[
        imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
]])

-- ToggleTerm settings
-- set("n", "<leader>T", [[<Cmd>ToggleTermToggleAll<CR>]], opts)
-- for _, i in pairs({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }) do
-- 	set({ "n", "i" }, "<c-" .. i .. ">", i .. [[<c-e>]], { remap = true })
-- end
-- function _G.set_terminal_keymaps()
-- 	local toggleterm_opts = { buffer = 0 }
-- 	set("t", "<esc>", [[<C-\><C-n>]], toggleterm_opts)
-- 	set("t", "<C-q>", [[<C-\><C-n><cmd>q<CR>]], toggleterm_opts)
-- 	set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], toggleterm_opts)
-- 	set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], toggleterm_opts)
-- 	set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], toggleterm_opts)
-- 	set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], toggleterm_opts)
-- 	set("t", "<C-w>", [[<C-\><C-n><C-w>]], toggleterm_opts)
-- 	for _, i in pairs({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }) do
-- 		set("t", "<c-" .. i .. ">", i .. [[<c-e>]], { remap = true })
-- 	end
-- end
-- vim.cmd([[autocmd! TermOpen term://* lua set_terminal_keymaps()]])
