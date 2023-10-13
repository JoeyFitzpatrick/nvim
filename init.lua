vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.lsp.set_log_level("error")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

require("lazy").setup("plugins")

require("set")
require("remap")

if vim.g.vscode ~= nil then
	require("vscode")
else
	require("non-vscode")
	vim.opt.relativenumber = true
end

function light()
	vim.cmd("set background=light | colorscheme catppuccin-latte")
end
function dark()
	vim.cmd("set background=dark | colorscheme mellifluous")
end
vim.cmd("command Light silent lua light()")
vim.cmd("command Dark silent lua dark()")
