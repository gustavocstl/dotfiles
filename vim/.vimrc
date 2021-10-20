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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'nickspoons/vim-sharpenup'
Plug 'OmniSharp/omnisharp-vim'
Plug 'psf/black', { 'branch': 'stable' }
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
set undofile
set undodir=~/.config/nvim/undo
set undolevels=10000
colorscheme gruvbox

let s:using_snippets = 0
let g:airline_theme='onehalfdark'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-cfn-lint', 'coc-python', 'coc-phpls', 'coc-git']
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
let g:vim_json_conceal = 0
let g:ranger_map_keys = 0
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:fzf_layout = { 'down': '~40%' }

map <leader>e :Ranger<CR>
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
" Format json
nnoremap <C-S-h> :%!jq .<CR>
" \b \f \g : go back/forward/last-used
nnoremap <C-k> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :b<space>

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

" Define sharpenup as , to execute commands
let maplocalleader = ","
let g:sharpnup_map_prefix = ',os'

autocmd BufWritePre *.py execute ':Black'
