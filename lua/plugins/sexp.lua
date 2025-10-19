return {
	"guns/vim-sexp",
	config = function()
		-- Enable sexp for all filetypes (empty string means all filetypes)
		vim.g.sexp_filetypes = ""

		local function setup_sexp_mappings()
			local opts = { silent = true, buffer = true }

			-- Text objects
			vim.keymap.set({ "x", "o" }, "af", "<Plug>(sexp_outer_list)", opts)
			vim.keymap.set({ "x", "o" }, "if", "<Plug>(sexp_inner_list)", opts)
			vim.keymap.set({ "x", "o" }, "aF", "<Plug>(sexp_outer_top_list)", opts)
			vim.keymap.set({ "x", "o" }, "iF", "<Plug>(sexp_inner_top_list)", opts)
			vim.keymap.set({ "x", "o" }, "as", "<Plug>(sexp_outer_string)", opts)
			vim.keymap.set({ "x", "o" }, "is", "<Plug>(sexp_inner_string)", opts)
			vim.keymap.set({ "x", "o" }, "ae", "<Plug>(sexp_outer_element)", opts)
			vim.keymap.set({ "x", "o" }, "ie", "<Plug>(sexp_inner_element)", opts)
			vim.keymap.set({ "x", "o" }, "ac", "<Plug>(sexp_outer_child_head)", opts)
			vim.keymap.set({ "x", "o" }, "ic", "<Plug>(sexp_inner_child_head)", opts)
			vim.keymap.set({ "x", "o" }, "aC", "<Plug>(sexp_outer_child_tail)", opts)
			vim.keymap.set({ "x", "o" }, "iC", "<Plug>(sexp_inner_child_tail)", opts)

			-- Movement to brackets
			vim.keymap.set({ "n", "x", "o" }, "(", "<Plug>(sexp_move_to_prev_bracket)", opts)
			vim.keymap.set({ "n", "x", "o" }, ")", "<Plug>(sexp_move_to_next_bracket)", opts)

			-- Element head/tail movement
			vim.keymap.set({ "n", "x", "o" }, "<M-b>", "<Plug>(sexp_move_to_prev_element_head)", opts)
			vim.keymap.set({ "n", "x", "o" }, "<M-w>", "<Plug>(sexp_move_to_next_element_head)", opts)
			vim.keymap.set({ "n", "x", "o" }, "g<M-e>", "<Plug>(sexp_move_to_prev_element_tail)", opts)
			vim.keymap.set({ "n", "x", "o" }, "<M-e>", "<Plug>(sexp_move_to_next_element_tail)", opts)

			-- Top element movement
			vim.keymap.set({ "n", "x", "o" }, "[[", "<Plug>(sexp_move_to_prev_top_element)", opts)
			vim.keymap.set({ "n", "x", "o" }, "]]", "<Plug>(sexp_move_to_next_top_element)", opts)

			-- Element selection
			vim.keymap.set({ "n", "x", "o" }, "[e", "<Plug>(sexp_select_prev_element)", opts)
			vim.keymap.set({ "n", "x", "o" }, "]e", "<Plug>(sexp_select_next_element)", opts)

			-- Flow to brackets
			vim.keymap.set({ "n", "x" }, "<M-]>", "<Plug>(sexp_flow_to_next_open)", opts)
			vim.keymap.set({ "n", "x" }, "<M-[>", "<Plug>(sexp_flow_to_prev_close)", opts)
			vim.keymap.set({ "n", "x" }, "<M-{>", "<Plug>(sexp_flow_to_prev_open)", opts)
			vim.keymap.set({ "n", "x" }, "<M-}>", "<Plug>(sexp_flow_to_next_close)", opts)

			-- Flow to leaf
			vim.keymap.set({ "n", "x" }, "<M-S-b>", "<Plug>(sexp_flow_to_prev_leaf_head)", opts)
			vim.keymap.set({ "n", "x" }, "<M-S-w>", "<Plug>(sexp_flow_to_next_leaf_head)", opts)
			vim.keymap.set({ "n", "x" }, "<M-S-g>", "<Plug>(sexp_flow_to_prev_leaf_tail)", opts)
			vim.keymap.set({ "n", "x" }, "<M-S-e>", "<Plug>(sexp_flow_to_next_leaf_tail)", opts)

			-- Cloning
			vim.keymap.set({ "n", "x" }, "<LocalLeader>c", "<Plug>(sexp_clone_list)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader><LocalLeader>c", "<Plug>(sexp_clone_list_sl)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>C", "<Plug>(sexp_clone_element)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader><LocalLeader>C", "<Plug>(sexp_clone_element_sl)", opts)

			-- Indentation
			vim.keymap.set("n", "==", "<Plug>(sexp_indent)", opts)
			vim.keymap.set("x", "=", "<Plug>(sexp_indent)", opts)
			vim.keymap.set("n", "=-", "<Plug>(sexp_indent_top)", opts)
			vim.keymap.set({ "n", "x" }, "<M-=>", "<Plug>(sexp_indent_and_clean)", opts)
			vim.keymap.set("n", "<M-->", "<Plug>(sexp_indent_and_clean_top)", opts)

			-- Alignment
			vim.keymap.set({ "n", "x" }, "<LocalLeader>a", "<Plug>(sexp_align_comments)", opts)
			vim.keymap.set("n", "<LocalLeader>A", "<Plug>(sexp_align_comments_top)", opts)

			-- Wrapping lists
			vim.keymap.set({ "n", "x" }, "<LocalLeader>i", "<Plug>(sexp_round_head_wrap_list)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>I", "<Plug>(sexp_round_tail_wrap_list)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>[", "<Plug>(sexp_square_head_wrap_list)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>]", "<Plug>(sexp_square_tail_wrap_list)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>{", "<Plug>(sexp_curly_head_wrap_list)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>}", "<Plug>(sexp_curly_tail_wrap_list)", opts)

			-- Wrapping elements
			vim.keymap.set({ "n", "x" }, "<LocalLeader>w", "<Plug>(sexp_round_head_wrap_element)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>W", "<Plug>(sexp_round_tail_wrap_element)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>e[", "<Plug>(sexp_square_head_wrap_element)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>e]", "<Plug>(sexp_square_tail_wrap_element)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>e{", "<Plug>(sexp_curly_head_wrap_element)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>e}", "<Plug>(sexp_curly_tail_wrap_element)", opts)

			-- Insert at list head/tail
			vim.keymap.set("n", "<LocalLeader>h", "<Plug>(sexp_insert_at_list_head)", opts)
			vim.keymap.set("n", "<LocalLeader>l", "<Plug>(sexp_insert_at_list_tail)", opts)

			-- Splice/convolute/raise
			vim.keymap.set("n", "<LocalLeader>@", "<Plug>(sexp_splice_list)", opts)
			vim.keymap.set("n", "<LocalLeader>?", "<Plug>(sexp_convolute)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>o", "<Plug>(sexp_raise_list)", opts)
			vim.keymap.set({ "n", "x" }, "<LocalLeader>O", "<Plug>(sexp_raise_element)", opts)

			-- Swapping
			vim.keymap.set({ "n", "x" }, "<M-k>", "<Plug>(sexp_swap_list_backward)", opts)
			vim.keymap.set({ "n", "x" }, "<M-j>", "<Plug>(sexp_swap_list_forward)", opts)
			vim.keymap.set({ "n", "x" }, "<M-h>", "<Plug>(sexp_swap_element_backward)", opts)
			vim.keymap.set({ "n", "x" }, "<M-l>", "<Plug>(sexp_swap_element_forward)", opts)

			-- Emitting/capturing
			vim.keymap.set({ "n", "x" }, "<M-S-j>", "<Plug>(sexp_emit_head_element)", opts)
			vim.keymap.set({ "n", "x" }, "<M-S-k>", "<Plug>(sexp_emit_tail_element)", opts)
			vim.keymap.set({ "n", "x" }, "<M-S-h>", "<Plug>(sexp_capture_prev_element)", opts)
			vim.keymap.set({ "n", "x" }, "<M-S-l>", "<Plug>(sexp_capture_next_element)", opts)

			-- Insert mode mappings
			vim.keymap.set("i", "<BS>", "<Plug>(sexp_insert_backspace)", opts)
			vim.keymap.set("i", '"', "<Plug>(sexp_insert_double_quote)", opts)
			vim.keymap.set("i", "(", "<Plug>(sexp_insert_opening_round)", opts)
			vim.keymap.set("i", ")", "<Plug>(sexp_insert_closing_round)", opts)
			vim.keymap.set("i", "[", "<Plug>(sexp_insert_opening_square)", opts)
			vim.keymap.set("i", "]", "<Plug>(sexp_insert_closing_square)", opts)
			vim.keymap.set("i", "{", "<Plug>(sexp_insert_opening_curly)", opts)
			vim.keymap.set("i", "}", "<Plug>(sexp_insert_closing_curly)", opts)
		end

		-- Set up autocommand to apply mappings for all filetypes
		local augroup = vim.api.nvim_create_augroup("VIM_SEXP_MAPPING", { clear = true })
		vim.api.nvim_create_autocmd("FileType", {
			group = augroup,
			pattern = "*",
			callback = setup_sexp_mappings,
		})
	end,
}
