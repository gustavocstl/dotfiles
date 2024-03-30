colorscheme zenbones
set background=dark
set nocompatible
set number
set shiftwidth=4
set tabstop=4
set incsearch
set showcmd
set showmode
set showmatch
set wildmenu
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set clipboard=unnamedplus,autoselect

filetype on
filetype plugin on
filetype indent on
syntax on

nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Ag<CR>

call plug#begin()
Plug 'epmatsw/ag.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()