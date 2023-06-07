-- Sick of pressing shift colon
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })
vim.keymap.set("v", ":", ";", { noremap = true })
vim.keymap.set("n", "<c-q>", ":qa<CR>", { noremap = true })

-- Quality of life new lines
vim.keymap.set("n", "<leader>o", "o<esc>k", { noremap = true })
vim.keymap.set("n", "<leader>O", "O<esc>j", { noremap = true })

-- Visual move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Center screen after vertical navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center screen after search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Better switching between splits
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Copy to clipboard
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>yy', '"+yy')

-- Paste from clipboard
vim.keymap.set('n', '<Leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<Leader>p', '"+p')
vim.keymap.set('v', '<Leader>P', '"+P')

-- Cut to clipboard
vim.keymap.set('n', '<leader>D', '""D')
vim.keymap.set('v', '<Leader>d', '""d')
vim.keymap.set('n', '<Leader>d', '""d')
vim.keymap.set('n', '<Leader>dd', '""dd')

-- Delete without cutting
vim.keymap.set('n', 'D', '"_D')
vim.keymap.set('v', 'd', '"_d')
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'dd', '"_dd')

-- Paste without yanking the pasted over text
vim.keymap.set('v', 'p', '"0p')
vim.keymap.set('v', 'P', '"0P')

-- Custom text objects
-- ie = inner entire buffer
vim.keymap.set('o', 'ie', ':exec "normal! ggVG"<cr>')

-- iv = current viewable text in the buffer
vim.keymap.set('o', 'iv', ':exec "normal! HVL"<cr>')

-- Remap for surround to avoid clashing with leap
vim.keymap.set('v', 'S', '<Plug>VSurround', { remap = false })


