call plug#begin()

Plug 'tpope/vim-surround'
Plug 'chrisbra/improvedft'
" Plug 'asvetliakov/vim-easymotion'
" Plug 'ggandor/lightspeed.nvim'
Plug 'phaazon/hop.nvim'

call plug#end()


let mapleader = " "
"lightspeed settings
"vnoremap z <Plug>Lightspeed_s
"vnoremap Z <Plug>Lightspeed_S

"nnoremap z <Plug>Lightspeed_s
"nnoremap Z <Plug>Lightspeed_S

" vim hop settings
lua << EOF
require'hop'.setup()
EOF
noremap z <cmd>HopWord<CR>
noremap Z <cmd>HopLine<CR>

nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")

:set ignorecase

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
