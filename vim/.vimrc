call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
Plug 'wojciechkepka/vim-github-dark'
Plug 'nickspoons/vim-sharpenup'
Plug 'OmniSharp/omnisharp-vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'puremourning/vimspector'
Plug 'easymotion/vim-easymotion'
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
set shellcmdflag=-ci
colorscheme ghdark 

let s:using_snippets = 0
let g:airline_theme='minimalist'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-cfn-lint', 'coc-python', 'coc-phpls', 'coc-git', 'coc-tsserver', 'coc-eslint']
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '▏'
let g:indentguides_ignorelist = ['json']
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
let g:ranger_map_keys = 0
let g:ale_linters = { 'cs': ['OmniSharp'], 'javascript': ['eslint'] }
let g:ale_fixers = {}
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_fix_on_save = 1
let g:fzf_layout = { 'down': '~40%' }
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = [ 'vscode-go', 'debugpy', 'debugger-for-chrome', 'netcoredbg', 'vscode-node-debug2' ]

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
nnoremap <C-f> :Ag<CR>
nnoremap <C-p> :Files<CR>

" \b \f \g : go back/forward/last-used
nnoremap <C-k> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :b<space>

" Vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga :CocAction<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Change to normal mode with ESC
tnoremap <Esc> <C-\><C-n>

" Define sharpenup as , to execute commands
let maplocalleader = ","
let g:sharpnup_map_prefix = ',os'

autocmd BufWritePre *.py execute ':Black'
autocmd FileType cs setlocal shiftwidth=4 tabstop=4 expandtab
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 expandtab
autocmd FileType yml setlocal shiftwidth=2 tabstop=2 expandtab
