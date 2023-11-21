local opts = { silent = true, noremap = true }

-- Sick of pressing shift colon
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })
vim.keymap.set("v", ":", ";", { noremap = true })
vim.keymap.set("n", "<c-q>", ":qa<CR>", { noremap = true })

-- Visual move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center screen after vertical navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center screen after search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to clipboard
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+yg_')
vim.keymap.set("n", "<Leader>y", '"+y')
vim.keymap.set("n", "<Leader>yy", '"+yy')

-- Paste from clipboard
vim.keymap.set("n", "<Leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<Leader>p", '"+p')
vim.keymap.set("v", "<Leader>P", '"+P')

-- Cut to clipboard
vim.keymap.set("n", "<leader>D", '""D')
vim.keymap.set("v", "<Leader>d", '""d')
vim.keymap.set("n", "<Leader>d", '""d')
vim.keymap.set("n", "<Leader>dd", '""dd')

-- Delete and copy without yanking
vim.keymap.set("n", "D", '"_D')
vim.keymap.set("v", "d", '"_d')
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("n", "dd", '"_dd')

vim.keymap.set("n", "C", '"_C')
vim.keymap.set("v", "c", '"_c')
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("n", "cc", '"_cc')

-- Paste without yanking the pasted over text
vim.keymap.set("v", "p", '"0p')
vim.keymap.set("v", "P", '"0P')

-- Same thing for x
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })

-- Custom text objects
-- ie = inner entire buffer
vim.keymap.set("o", "ie", ':exec "normal! ggVG"<cr>')

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
	vim.keymap.set("v", "A" .. char, "a" .. char .. "V", { remap = true })
	for _, op in pairs(operations) do
		local leader_op = "<leader>" .. op
		vim.keymap.set("n", op .. "A" .. char, "<esc>vA" .. char .. op, { remap = true })
		vim.keymap.set("n", leader_op .. "A" .. char, "<esc>vA" .. char .. leader_op, { remap = true })
	end
end

-- Remap for surround to avoid clashing with leap
vim.keymap.set("v", "S", "<Plug>VSurround", { remap = false })

vim.keymap.set("v", "y", "ygv<esc>", { remap = false })

-- Easier jumps to start/end of line
vim.keymap.set({ "n", "v" }, "L", "$")
vim.keymap.set({ "n", "v" }, "H", "_")

-- better navigation for wrapped lines
vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

-- Save with ctrl+w
vim.keymap.set("n", "<C-w>", "<cmd>wa<CR>")
vim.keymap.set("i", "<C-w>", "<esc><cmd>wa<CR>")

vim.keymap.set("n", "<leader>ai", ":ChatGPT<CR>", { desc = "Open GPT prompt" })
vim.keymap.set("n", "<leader>aa", ":ChatGPTActAs<CR>", { desc = "Open premade GPT prompt" })
vim.keymap.set("n", "<leader>ac", ":ChatGPTCompleteCode<CR>", { desc = "[a]i auto[c]omplete" })
vim.keymap.set("v", "<leader>ai", "<Esc>:ChatGPTEditWithInstructions<CR>", { desc = "Edit selected text with GPT" })
vim.keymap.set("v", "<leader>aa", "<Esc>:ChatGPTRun", { desc = "Run actions on code with GPT" })

vim.keymap.set("n", "<leader>tt", ":TroubleToggle<CR>", { desc = "[T]oggle [T]rouble diagnostics" })
vim.keymap.set(
	"n",
	"<leader>tw",
	":TroubleToggle workspace_diagnostics<CR>",
	{ desc = "[T]oggle [W]orkspace diagnostics" }
)

vim.cmd([[
        imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
]])
