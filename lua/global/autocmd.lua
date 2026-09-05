local augroup = vim.api.nvim_create_augroup("Joey", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
	desc = "Open file at the last position it was edited earlier",
	pattern = "*",
	callback = function()
		vim.cmd('silent! normal! g`"zv')
	end,
	group = augroup,
})

local closable_buftypes = { quickfix = true, help = true, nofile = true }

vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Close utility buffers with q",
	pattern = "*",
	callback = function(data)
		if closable_buftypes[vim.bo[data.buf].buftype] then
			vim.keymap.set("n", "q", "<cmd>close<CR>", { buf = data.buf, desc = "Close buffer" })
		end
	end,
	group = augroup,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.hl_op({ higroup = "IncSearch", timeout = 200 })
	end,
	group = augroup,
	pattern = "*",
})

-- yankring
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("YankRing", { clear = true }),
	callback = function()
		if vim.v.event.operator == "y" then
			for i = 9, 1, -1 do -- Shift all numbered registers.
				vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
			end
		end
	end,
})

-- auto install treesitter parsers
vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		local available_langs = require("nvim-treesitter").get_available()
		local is_available = vim.tbl_contains(available_langs, lang)
		if is_available then
			local installed_langs = require("nvim-treesitter").get_installed()
			local installed = vim.tbl_contains(installed_langs, lang)
			if not installed then
				require("nvim-treesitter").install(lang):wait()
			end
			vim.treesitter.start()
			require("nvim-treesitter").indentexpr()
		end
	end,
})
