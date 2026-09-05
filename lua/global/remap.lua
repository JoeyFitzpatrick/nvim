local set = vim.keymap.set

-- Sick of pressing shift colon
set("n", ";", ":")
set("v", ";", ":")
set("n", ":", ";")
set("v", ":", ";")
set("n", "<leader>;", ":<C-f>", { desc = "Enter command-mode buffer" })

-- Copy to clipboard
set({ "n", "x" }, "<Leader>y", '"+y')
set("n", "<leader>Y", '"+yg_')
set("n", "<Leader>yy", '"+yy')

-- Paste from clipboard
set({ "n", "x" }, "<Leader>p", '"+p')
set({ "n", "x" }, "<leader>P", '"+P')

-- Cut to clipboard
set("n", "<leader>D", '""D')
set({ "n", "x" }, "<Leader>d", '""d')
set("n", "<Leader>dd", '""dd')

-- Delete and copy without yanking
set("n", "D", '"_D')
set({ "n", "x" }, "d", '"_d')
set("n", "dd", '"_dd')

set("n", "C", '"_C')
set({ "n", "x" }, "c", '"_c')
set("n", "cc", '"_cc')

-- Paste without yanking the pasted over text
set("v", "p", '"0p')
set("v", "P", '"0P')

-- Same thing for x
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })

-- Custom text objects
-- ie = inner entire buffer
set("o", "ie", ':exec "normal! ggVG"<cr>')

set("n", "<leader>n", function()
	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	vim.fn.setreg("+", filename)
	print("Copied to clipboard: " .. filename)
end, { desc = "Copy relative path of current file" })

set("n", "M", "<cmd>messages<CR>", { noremap = true })

set("n", "ycc", "yygccp", { remap = true, desc = "Copy-paste current line and comment it" })

set("n", "<leader>rs", "<cmd>wa | restart<CR>", { desc = "Restart" })

for _, key in ipairs({ "h", "j", "k", "l" }) do
	set({ "n", "t" }, "<C-" .. key .. ">", function()
		vim.cmd("wincmd " .. key)
	end, { noremap = true })
end

set("n", "<leader>rl", "<cmd>w | so<CR>", { desc = "Reload and source buffer" })

-- tabs
set("n", "[t", "<cmd>tabprevious<CR>", { noremap = true, desc = "Previous tab" })
set("n", "]t", "<cmd>tabnext<CR>", { noremap = true, desc = "Next tab" })

-- buffers
set("n", "<leader>bd", "<cmd>bd!<CR>", { noremap = true, desc = "Delete buffer" })

set("n", "<M-p>", "<cmd>cprevious<CR>", { noremap = true, desc = "Previous quickfix item" })
set("n", "<M-n>", "<cmd>cnext<CR>", { noremap = true, desc = "Next quickfix item" })

set("t", "<A-esc>", "<C-\\><C-n>") -- leave insert mode in terminal

set("n", "<leader>u", "<cmd>Undotree<CR>", { desc = "Open undotree" })

set("n", "<leader>cb", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })
set("n", "<leader>ct", "<cmd>tabclose<CR>", { desc = "Close the current tab" })

vim.keymap.set({ "n", "x", "o" }, "<A-o>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "n", "x", "o" }, "<A-i>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })

set("n", "<leader>o", "<cmd>only<CR>", { desc = "Run :only" })

set("n", "<leader>jj", function()
	vim.cmd("tab term lazyjira")
	vim.cmd("startinsert")
end, { desc = "Open lazyjira in new tab" })

set("n", "<Esc>", function()
	local mc_ns = vim.api.nvim_create_namespace("nvim.multicursor")
	vim.api.nvim_buf_clear_namespace(0, mc_ns, 0, -1)
end, { noremap = true, silent = true, desc = "Clear multicursors" })
