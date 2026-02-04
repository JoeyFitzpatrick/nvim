local opts = { silent = true, noremap = true }
local set = vim.keymap.set

-- Sick of pressing shift colon
set("n", ";", ":")
set("v", ";", ":")
set("n", ":", ";")
set("v", ":", ";")
set("n", "<leader>;", ":<C-f>", { desc = "Enter command-mode buffer" })

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

-- better window navigation.
set({ "n", "t" }, "<C-h>", function()
	vim.cmd("wincmd h")
end, { noremap = true })
set({ "n", "t" }, "<C-j>", function()
	vim.cmd("wincmd j")
end, { noremap = true })
set({ "n", "t" }, "<C-k>", function()
	vim.cmd("wincmd k")
end, { noremap = true })
set({ "n", "t" }, "<C-l>", function()
	vim.cmd("wincmd l")
end, { noremap = true })

set("n", "<leader>rl", "<cmd>w | so<CR>", { desc = "Reload and source buffer" })

-- tabs
set("n", "[t", "<cmd>tabprevious<CR>", { noremap = true, desc = "Previous tab" })
set("n", "]t", "<cmd>tabnext<CR>", { noremap = true, desc = "Next tab" })
set("n", "<leader><tab>n", "<cmd>tabnew<CR>", { noremap = true, desc = "New tab" })
set("n", "<leader><tab>q", "<cmd>tabclose<CR>", { noremap = true, desc = "Close tab" })

-- buffers
set("n", "<leader>bd", "<cmd>bd!<CR>", { noremap = true, desc = "Delete buffer" })

-- some [ and ] mappings
set("n", "[q", "<cmd>cprevious<CR>", { noremap = true, desc = "Previous quickfix item" })
set("n", "]q", "<cmd>cnext<CR>", { noremap = true, desc = "Next quickfix item" })
set("n", "[r", "<cmd>Trunks time-machine-previous<CR>", { noremap = true, desc = "Previous time-machine item" })
set("n", "]r", "<cmd>Trunks time-machine-next<CR>", { noremap = true, desc = "Next time-machine item" })

set("n", "<leader>rs", "<cmd>w | restart<CR>", { desc = "Call :restart" })

set("n", "cq", function()
	vim.cmd("call inputsave()")
	local current_macro = vim.fn.getreg("q")
	local new_macro = vim.fn.input("Change macro @q: ", current_macro)
	vim.fn.setreg("q", new_macro)
	vim.cmd("call inputrestore()")
end, { desc = "Change macro at q register" })
