call plug#begin()

Plug 'tpope/vim-surround'
Plug 'chrisbra/improvedft'
Plug 'rebelot/kanagawa.nvim'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'svermeulen/vim-cutlass'
Plug 'ggandor/leap.nvim'
Plug 'svermeulen/vim-subversive'
Plug 'rhysd/clever-f.vim'
Plug 'ggandor/leap-spooky.nvim'

call plug#end()

let mapleader = " "

lua require('leap').add_default_mappings()
lua require('leap-spooky').setup()

:set ignorecase
:set autoindent

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Custom text objects
" ie = inner entire buffer
onoremap ie :exec "normal! ggVG"<cr>

" iv = current viewable text in the buffer
onoremap iv :exec "normal! HVL"<cr>

" cutlass settings: remap m to cut/move
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" subversive settings
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)

" clever-f settings
" g:clever_f_smart_case = 1

" NERDTree settings
nnoremap <C-n> :NERDTreeToggle<CR>

" fzf settings
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
" don't consider filename as match
" command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" non-vscode settings
if exists('g:vscode')
    " VSCode only settings
else
    " ordinary Neovim settings
	:set number relativenumber
	colorscheme kanagawa
endif
