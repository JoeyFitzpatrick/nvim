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

-- require('leap').add_default_mappings(true)
-- require('leap-spooky').setup({ paste_on_remote_yank = true })

require("set")
require("remap")

if vim.g.vscode ~= nil then
	require("vscode")
else
	require("non-vscode")
	vim.opt.relativenumber = true

    -- Make the background transparent
	vim.cmd([[
        augroup user_colors
          autocmd!
          autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
          augroup END
    ]])
	-- vim.cmd.colorscheme("catppuccin") -- catppuccin, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
end

-- vim.api.nvim_create_autocmd("FileType", {pattern = 'hs', command = [[:HlsStart]]})
