local opts = { silent = true, noremap = true }
local set = vim.keymap.set

-- Sick of pressing shift colon
set("n", ";", ":", { noremap = true })
set("v", ";", ":", { noremap = true })
set("n", ":", ";", { noremap = true })
set("v", ":", ";", { noremap = true })

-- Center screen after vertical navigation
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

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

-- better tab navigation
set({ "n", "t" }, "<C-n>", function()
	vim.cmd("tabnext")
end, { noremap = true, silent = true })
set({ "n", "t" }, "<C-p>", function()
	vim.cmd("tabprev")
end, { noremap = true, silent = true })

-- terminal mappings
set("t", "<A-esc>", "<C-\\><C-n>") -- leave insert mode in terminal

-- Custom text objects
-- ie = inner entire buffer
set("o", "ie", ':exec "normal! ggVG"<cr>')

-- Remap for surround to avoid clashing with leap
set("v", "S", "<Plug>VSurround", { remap = false })

set("v", "y", "ygv<esc>", { remap = false })

-- quickfix
-- Create an autocmd for FileType with pattern "qf"
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
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

set("n", "cn", "<cmd>cnext<CR>", opts)
set("n", "cp", "<cmd>cprev<CR>", opts)

set("n", "<leader>N", function()
	local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	vim.fn.setreg("+", filename)
	print("Copied to clipboard: " .. filename)
end)

set("n", "M", "<cmd>messages<CR>", { noremap = true })

set("i", "<C-l>", "<right>", { desc = "Go right one char" })
set("i", "<C-h>", "<left>", { desc = "Go left one char" })

set("n", "ycc", "yygccp", { remap = true, desc = "Copy-paste current line and comment it" })

set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { noremap = true, silent = true })
