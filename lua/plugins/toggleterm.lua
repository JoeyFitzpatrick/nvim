return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		local status_ok, toggleterm = pcall(require, "toggleterm")
		if not status_ok then
			return
		end

		toggleterm.setup({
			size = 20,
			open_mapping = "<leader>vh",
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n><cmd>q<CR>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		-- if you only want these mappings for toggle term use term://*toggleterm#* instead
		local term_open_group = vim.api.nvim_create_augroup("SetTerminalKeymapsGroup", { clear = true })

		vim.api.nvim_create_autocmd("TermOpen", {
			callback = function()
				set_terminal_keymaps()
			end,
			group = term_open_group,
			pattern = "*",
		})

		local buf_enter_group = vim.api.nvim_create_augroup("StartInsertTerminalGroup", { clear = true })
		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function()
				if vim.bo.buftype == "terminal" then
					vim.cmd("startinsert!")
				end
			end,
			group = buf_enter_group,
			pattern = "*",
		})

		local vim_quit_group = vim.api.nvim_create_augroup("VimQuitGroup", { clear = true })
		vim.api.nvim_create_autocmd("VimLeavePre", {
			callback = function()
				if vim.bo.buftype == "terminal" then
					vim.cmd("cbuffer!")
				end
			end,
			group = vim_quit_group,
			pattern = "*",
		})

		vim.keymap.set(
			"n",
			"<leader>vj",
			"<cmd>ToggleTerm size=70 direction=vertical<cr>",
			{ desc = "Vertical terminal" }
		)
		vim.keymap.set(
			"n",
			"<leader>vk",
			"<cmd>2TermExec size=70 direction=vertical cmd='pn vitest %'<cr>",
			{ desc = "Vertical terminal" }
		)
		vim.keymap.set("n", "<leader>vl", "<cmd>ToggleTermToggleAll<cr>", { desc = "Toggle all terminals" })
	end,
}
