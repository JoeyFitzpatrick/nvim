require('lualine').setup()
require('treesitter-config')
require('lsp-config')

vim.g.mapleader = " "

-- telescope settings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>rg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>q', builtin.quickfix, {})
vim.keymap.set('n', '<C-p>', ":lua require'telescope'.extensions.project.project{}<CR>",
{ noremap = true, silent = true })

require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})
local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
vim.keymap.set('n', '<leader>hs', ui.toggle_quick_menu, {})
vim.keymap.set('n', '<leader>ha', mark.add_file, {})
vim.keymap.set('n', '<leader>hn', ui.nav_next, {})
vim.keymap.set('n', '<leader>hp', ui.nav_prev, {})
vim.keymap.set('n', '<leader>h1', function() ui.nav_file(1) end, {})
vim.keymap.set('n', '<leader>h2', function() ui.nav_file(2) end, {})
vim.keymap.set('n', '<leader>h3', function() ui.nav_file(3) end, {})
vim.keymap.set('n', '<leader>h4', function() ui.nav_file(4) end, {})
vim.keymap.set('n', '<leader>h5', function() ui.nav_file(5) end, {})
vim.keymap.set('n', '<leader>h6', function() ui.nav_file(6) end, {})
vim.keymap.set('n', '<leader>h7', function() ui.nav_file(7) end, {})
vim.keymap.set('n', '<leader>h8', function() ui.nav_file(8) end, {})
vim.keymap.set('n', '<leader>h9', function() ui.nav_file(9) end, {})

-- Easier tab navigation
vim.keymap.set("n", "L", "gt")
vim.keymap.set("n", "H", "gT")

-- Lazygit
vim.keymap.set('n', '<Leader>lg', ':LazyGit<CR>', { silent = true })

-- nvim-tree settings
vim.keymap.set('n', '<Leader>n', ';NvimTreeToggle<CR>', { remap = true })
vim.keymap.set('n', '<Leader>N', ';NvimTreeFocus<CR>', { remap = true })

-- fzf settings
vim.keymap.set('n', '<C-f>', ':Files<CR>', { silent = true })
-- vim.keymap.set('n', '<Leader>rg', ':Rg<CR>', { silent = true })
-- don't consider filename as match
-- command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

-- command! -bang -nargs=* Rg
--   \ call fzf#vim#grep(
--   \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
--   \   fzf#vim#with_preview(), <bang>0)
