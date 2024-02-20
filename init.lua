vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_disable_netrw = 0

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- this is here because vim-visual-multi is weird
vim.cmd([[
    let g:VM_maps = {}
    let g:VM_maps['Find Under']         = '<C-m>'           " replace C-n
    let g:VM_maps['Find Subword Under'] = '<C-m>'           " replace visual C-n
    let g:VM_theme = 'neon'
    let g:VM_Mono_hl   = 'DiffText'
    let g:VM_Extend_hl = 'DiffAdd'
    let g:VM_Cursor_hl = 'Visual'
    let g:VM_Insert_hl = 'DiffChange'
]])

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})

require("global.set")
require("global.remap")
require("global.plugin-remaps")
require("global.lsp-config")
require("global.utils")
