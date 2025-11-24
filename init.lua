vim.g.mapleader = " "

vim.g.nvim_tree_disable_netrw = 0

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

Nmap = function(lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set("n", lhs, rhs, opts)
end

require("config.lazy")

require("global.set")
require("global.remap")
require("global.autocmd")
require("global.lsp-config")
require("global.snippets")
require("global.helpers.term")
require("global.tabs").setup()
require("global.instant_transmission")
