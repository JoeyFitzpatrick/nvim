local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'chrisbra/improvedft'
Plug 'rebelot/kanagawa.nvim'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug('junegunn/fzf', { ['do'] = function() vim.call('fzf#install') end })
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'svermeulen/vim-cutlass'
Plug 'ggandor/leap.nvim'
Plug 'svermeulen/vim-subversive'
Plug 'rhysd/clever-f.vim'
Plug 'ggandor/leap-spooky.nvim'

vim.call('plug#end')

vim.g.mapleader = " "

require('leap').add_default_mappings()
require('leap-spooky').setup()

vim.opt.ignorecase = true
vim.opt.autoindent = true

-- Copy to clipboard
vim.keymap.set('v', '<Leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+yg_')
vim.keymap.set('n', '<Leader>y', '"+y')
vim.keymap.set('n', '<Leader>yy', '"+yy')


-- Paste from clipboard
vim.keymap.set('n', '<Leader>p', '"+p')
vim.keymap.set('n', '<leader>P', '"+P')
vim.keymap.set('v', '<Leader>p', '"+p')
vim.keymap.set('v', '<Leader>P', '"+P')


-- Custom text objects
-- ie = inner entire buffer
vim.keymap.set('o', 'ie', ':exec "normal! ggVG"<cr>')

-- iv = current viewable text in the buffer
vim.keymap.set('o', 'iv', ':exec "normal! HVL"<cr>')

-- cutlass settings: remap m to cut/move
vim.keymap.set('n', 'm', 'd')
vim.keymap.set('x', 'm', 'd')
vim.keymap.set('n', 'mm', 'dd')
vim.keymap.set('n', 'M', 'D')

-- subversive settings
vim.keymap.set('n', '<Leader>s', '<plug>(SubversiveSubstituteRange)', { remap = true })
vim.keymap.set('x', '<Leader>s', '<plug>(SubversiveSubstituteRange)', { remap = true })
vim.keymap.set('n', '<Leader>ss', '<plug>(SubversiveSubstituteWordRange', { remap = true })


-- clever-f settings
-- g:clever_f_smart_case = 1

-- NERDTree settings
vim.keymap.set('n', '<C-n>', ':NERDTreeToggle<CR>')

-- fzf settings
vim.keymap.set('n', '<silent> <C-f>', ':Files<CR>')
vim.keymap.set('n', '<silent> <Leader>f', ':Rg<CR>')
-- don't consider filename as match
-- command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

-- command! -bang -nargs=* Rg
--   \ call fzf#vim#grep(
--   \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
--   \   fzf#vim#with_preview(), <bang>0)


-- non-vscode settings
if vim.g.vscode ~= nil then
    -- VSCode only settings
else
    -- ordinary Neovim settings
	vim.opt.relativenumber = true
	vim.cmd('colorscheme kanagawa')
end
