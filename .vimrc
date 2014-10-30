colorscheme evening 
:set noswapfile

"Pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

"Split remap
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Double escape saves
map <Esc><Esc> :w<CR>

"NERDTree
autocmd vimenter * NERDTree

"set window size
set lines=60 columns=120

"setting indents 
:set nocompatible
filetype plugin indent on
set tabstop=2 softtabstop=0 noexpandtab shiftwidth=2

"js code checker config for syntastic
let g:syntastic_javascript_checkers = ['eslint']

"auto folding of js files
au FileType javascript call JavaScriptFold()

"configuring better key combinations for cut, copy, paste in gvim
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"commenting a la RStudio. You have to select in Visual Block mode for this to
"work
vmap <C-S-c> I//<Esc>
