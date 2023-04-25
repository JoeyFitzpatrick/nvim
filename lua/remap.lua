-- Sick of pressing shift colon
vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("v", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })
vim.keymap.set("v", ":", ";", { noremap = true })

-- Remap marks so I can use m for other commands
vim.keymap.set("n", "<leader>m", "m", { noremap = true })

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
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

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

-- Custom text objects
-- ie = inner entire buffer
vim.keymap.set('o', 'ie', ':exec "normal! ggVG"<cr>')

-- iv = current viewable text in the buffer
vim.keymap.set('o', 'iv', ':exec "normal! HVL"<cr>')

-- cutlass settings: remap m to cut/move
vim.keymap.set('n', 'm', 'd')
vim.keymap.set('x', 'm', 'd')
vim.keymap.set('n', 'mm', 'dd')
vim.keymap.set('n', 'M', 'D')

-- Remap for surround to avoid clashing with leap
vim.keymap.set('v', 'S', '<Plug>VSurround', { remap = false })


