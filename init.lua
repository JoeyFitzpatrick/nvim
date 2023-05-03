vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw at the very start of your init.lua (strongly advised)
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

require("lazy").setup('plugins')

require('leap').add_default_mappings(true)
require('set')
require('remap')
require('leap-spooky').setup({ paste_on_remote_yank = true })

if vim.g.vscode ~= nil then
    -- VSCode only settings
    require('vscode')
else
    -- ordinary Neovim settings
    require('non-vscode')
	vim.opt.relativenumber = true
	vim.cmd('colorscheme kanagawa')
	-- vim.cmd('colorscheme catppuccin-latte') -- catppuccin, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
end

