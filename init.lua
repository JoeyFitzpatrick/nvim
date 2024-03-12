vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_disable_netrw = 0

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nmap = function(lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set("n", lhs, rhs, opts)
end

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
require("global.visual-multi")

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})

require("global.set")
require("global.remap")
require("global.autocmd")
require("global.lsp-config")
require("global.utils")
require("global.helpers.tmux")
