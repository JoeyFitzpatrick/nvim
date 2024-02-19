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

-- these remaps are here because vim-visual-multi is weird
vim.cmd([[
    let g:VM_maps = {}
    let g:VM_maps['Find Under']         = '<C-m>'           " replace C-n
    let g:VM_maps['Find Subword Under'] = '<C-m>'           " replace visual C-n
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
