vim.g.mapleader = " "
vim.g.did_install_default_menus = 1
vim.g.loaded_netrwPlugin = 0
vim.o.synmaxcol = 500

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

Nmap = function(lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set("n", lhs, rhs, opts)
end

local nvm_default = vim.fn.expand("~/.nvm/alias/default")
if vim.fn.filereadable(nvm_default) == 1 then
	local version = vim.fn.readfile(nvm_default)[1]:gsub("^v", "")
	local node_bin = vim.fn.expand("~/.nvm/versions/node/v") .. version .. "/bin"
	if vim.fn.isdirectory(node_bin) == 1 and not vim.env.PATH:find(node_bin, 1, true) then
		vim.env.PATH = node_bin .. ":" .. vim.env.PATH
	end
end

require("config.lazy")

require("global.set")
require("global.remap")
require("global.autocmd")
require("global.lsp-config")
require("global.snippets")
require("global.tabs").setup()

vim.cmd("packadd nohlsearch")
vim.cmd("packadd nvim.undotree")
