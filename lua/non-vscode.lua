require('lualine').setup()
require('treesitter-config')
require('lsp-config')
require('toggle_lsp_diagnostics').init()

vim.g.mapleader = " "


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

-- Lazygit
vim.keymap.set('n', '<Leader>lg', ':LazyGit<CR>', { silent = true })

-- nvim-tree settings
vim.keymap.set('n', '<Leader>n', ';NvimTreeToggle<CR>', { remap = true })
vim.keymap.set('n', '<Leader>N', ';NvimTreeFocus<CR>', { remap = true })

vim.keymap.set('n', '<Leader>t', ';TransparentToggle<CR>', { remap = true })
vim.keymap.set('n', '<Leader>b', ';GitBlameToggle<CR>', { remap = true })


function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

local opts = { noremap = true, silent = true }

vim.keymap.set('v', '<space>g', function()
	local text = vim.getVisualSelection()
	builtin.live_grep({ default_text = text })
end, opts)

vim.keymap.set('n', '<Leader>t', ';ToggleDiag<CR>', { remap = true })

vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
    desc = "Open Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
