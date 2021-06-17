call plug#begin()
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'thaerkh/vim-indentguides'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

syntax on
set nolist
set number
set termguicolors
set nohlsearch
set conceallevel=0
set t_Co=256
set cursorline
set cursorcolumn
set statusline+=%{gutentags#statusline()}
set encoding=utf-8
set fileencoding=utf-8
set shiftwidth=4
set autoindent
set smartindent
colorscheme onehalfdark

let g:airline_theme='onehalfdark'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:lamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-cfn-lint', 'coc-jedi', 'coc-phpls']
let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-s> :w!<CR>
nnoremap <C-q> :qa<CR>
nnoremap <F1> :tabprevious<CR>
nnoremap <F2> :tabnext<CR>
nnoremap <silent> <s-Down> :m +1<CR>
nnoremap <silent> <s-Up> :m -2<CR>
vnoremap <C-c> "+y<CR>
nnoremap <C-S-f> :Ag<CR>
nnoremap <C-p> :Files<CR>
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.

" CoC.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Change to normal mode with ESC
tnoremap <Esc> <C-\><C-n>
" Start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
  belowright split term://zsh
  resize 15
endfunction
nnoremap <c-j> :call OpenTerminal()<CR>
