call plug#begin()

Plug 'tpope/vim-surround'
Plug 'chrisbra/improvedft'
Plug 'ggandor/lightspeed.nvim'

call plug#end()


let mapleader = " "
"lightspeed settings
vnoremap z <Plug>Lightspeed_s
vnoremap Z <Plug>Lightspeed_S

nnoremap z <Plug>Lightspeed_s
nnoremap Z <Plug>Lightspeed_S

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

" " Remap HJKL for bigger jumps
map H 10h
map J 10j
map K 10k
map L 10l
