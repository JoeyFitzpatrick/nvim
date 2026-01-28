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

require("config.lazy")

require("global.set")
require("global.remap")
require("global.autocmd")
require("global.lsp-config")
require("global.snippets")
require("global.helpers.term")
require("global.tabs").setup()
require("global.instant_transmission")
