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

-- Close tabs
vim.keymap.set("n", "<leader>x", "<cmd>tabc<CR>")

-- Restart LSP
vim.keymap.set("n", "<leader>l", ":LspRestart<CR>", { desc = "Restart [l]sp" })

vim.keymap.set("n", "<leader>ai", ":ChatGPT<CR>", { desc = "Open GPT prompt" })
vim.keymap.set("n", "<leader>aa", ":ChatGPTActAs<CR>", { desc = "Open premade GPT prompt" })
vim.keymap.set("n", "<leader>ac", ":ChatGPTCompleteCode<CR>", { desc = "[a]i auto[c]omplete" })
vim.keymap.set("v", "<leader>ai", "<Esc>:ChatGPTEditWithInstructions<CR>", { desc = "Edit selected text with GPT" })
vim.keymap.set("v", "<leader>aa", "<Esc>:ChatGPTRun", { desc = "Run actions on code with GPT" })

vim.keymap.set("n", "<leader>tt", ":TroubleToggle<CR>", { desc = "[T]oggle [T]rouble diagnostics" })
vim.keymap.set("n", "<leader>v", ":DiffviewOpen<CR>", { desc = "Diff[v]iew open" })
vim.keymap.set(
	"n",
	"<leader>tw",
	":TroubleToggle workspace_diagnostics<CR>",
	{ desc = "[T]oggle [W]orkspace diagnostics" }
)

local butterfish_opts = { noremap = true, silent = false }
vim.keymap.set("n", "<leader><leader>p", ":BFFilePrompt ", butterfish_opts)
vim.keymap.set("n", "<leader><leader>r", ":BFRewrite ", butterfish_opts)
vim.keymap.set("v", "<leader><leader>r", ":BFRewrite ", butterfish_opts)
vim.keymap.set("n", "<leader><leader>c", ":BFComment<CR>", butterfish_opts)
vim.keymap.set("v", "<leader><leader>c", ":BFComment<CR>", butterfish_opts)
vim.keymap.set("n", "<leader><leader>e", ":BFExplain<CR>", butterfish_opts)
vim.keymap.set("v", "<leader><leader>e", ":BFExplain<CR>", butterfish_opts)
vim.keymap.set("n", "<leader><leader>f", ":BFFix<CR>", butterfish_opts)
vim.keymap.set("n", "<leader><leader>i", ":BFImplement<CR>", butterfish_opts)
vim.keymap.set("n", "<leader><leader>d", ":BFEdit ", butterfish_opts)
vim.keymap.set("n", "<leader><leader>h", ":BFHammer<CR>", butterfish_opts)
vim.keymap.set("n", "<leader><leader>q", ":BFQuestion ", butterfish_opts)

vim.keymap.set("n", "cn", ":cnext<cr>", opts)
vim.keymap.set("n", "cp", ":cprev<cr> ", opts)
vim.keymap.set("n", "<leader>q", function()
	require("helpers.quickfix").toggle_qf()
end, opts)

-- Set keybindings for quickfix window only
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "qf",
-- 	callback = function()
-- 		vim.keymap.set("n", "q", ":q<CR>", { buffer = true })
-- 	end,
-- })
-- Create an autocmd for FileType with pattern "qf"
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		-- Undo the modified j and k keybindings in the quickfix window
		vim.keymap.set("n", "j", "j", { buffer = true, noremap = true })
		vim.keymap.set("n", "k", "k", { buffer = true, noremap = true })
		-- Set 'q' to close the quickfix window in normal mode
		vim.keymap.set("n", "q", ":q<CR>", { buffer = true })
		-- Set 'dd' to remove an item from the quickfix list in normal mode
		vim.keymap.set("n", "dd", function()
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
-- vim.keymap.set("n", "<leader>T", [[<Cmd>ToggleTermToggleAll<CR>]], opts)
-- for _, i in pairs({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }) do
-- 	vim.keymap.set({ "n", "i" }, "<c-" .. i .. ">", i .. [[<c-e>]], { remap = true })
-- end
-- function _G.set_terminal_keymaps()
-- 	local toggleterm_opts = { buffer = 0 }
-- 	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], toggleterm_opts)
-- 	vim.keymap.set("t", "<C-q>", [[<C-\><C-n><cmd>q<CR>]], toggleterm_opts)
-- 	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], toggleterm_opts)
-- 	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], toggleterm_opts)
-- 	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], toggleterm_opts)
-- 	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], toggleterm_opts)
-- 	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], toggleterm_opts)
-- 	for _, i in pairs({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }) do
-- 		vim.keymap.set("t", "<c-" .. i .. ">", i .. [[<c-e>]], { remap = true })
-- 	end
-- end
-- vim.cmd([[autocmd! TermOpen term://* lua set_terminal_keymaps()]])
