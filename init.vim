""""""""""""""""""""""""""""""""""
"""""""""""" VIM PLUG """""""""""""
"""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tlib_vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'nikvdp/ejs-syntax'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'shime/vim-livedown'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'majutsushi/tagbar'
Plug 'machakann/vim-highlightedyank'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons'
Plug 'lifepillar/pgsql.vim'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-grepper'
Plug 'pelodelfuego/vim-swoop'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-ingo-library'
call plug#end()

"""""""""""""""""""""""""""""""""""
"""""""""""" REMAPS """""""""""""""
"""""""""""""""""""""""""""""""""""
let mapleader=","
inoremap jk <ESC>
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-J> <C-W>j
map <C-K> <C-W>k
nmap <C-v> :vertical resize +5<cr>
nmap <leader>p :NERDTreeToggle<cr>
" Fold with space
nnoremap <space> za
" remap multiple window keys
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <F8> :TagbarToggle<CR>

" deoplete tab
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""
"""""""""""" VIM SETTINGS """""""""
"""""""""""""""""""""""""""""""""""

set diffopt+=vertical
set hidden
let g:deoplete#enable_at_startup = 1

" .vimrc folding
augroup filetype_vim
  autocmd FileType vim setlocal foldmethod=marker
set nofoldenable    " disable foldingaugroup END

"enable syntax highlighting
syntax enable

" Split down and right
set splitbelow
set splitright

" highlight search
set hlsearch

"incremental search
"set incsearch

" show line numbers
set number

" set line highlighting
set cursorline

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent
set smarttab
filetype on
filetype plugin on
filetype indent on
" space > tab
set expandtab
" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4
set tabstop=4
" show the matching part of the pair for [] {} and ()
set showmatch
" enable all Python syntax highlighting features
let python_highlight_all = 1
" History/Undo settings
" " We have computers with pretty big
" " hard drives, so let's keep these
set history=1000
set undofile
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

" lightline
set laststatus=2
set t_Co=256
set encoding=utf-8
set wrap

" Nerd tree
let NERDTreeSHowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore = ['\.pyc$']

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" let me use the damn mouse to resize windows
set mouse=a

" workaround for backspace not working
set bs=2

let delimitMate_expand_cr = 1

"colour scheme
colorscheme challenger_deep

"Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" TypeScript YouCompleteMe
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" TypeScript linting
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
autocmd GUIEnter * set vb t_vb=
let g:jsx_ext_required = 0 " Allow JSX in js files

" fzf vim settings
nmap ; :Buffers<CR>
nmap <C-p> :Files<CR>
nmap <C-t> :Tags<CR>

" fuzzy file findef for macos
if has('macunix')
    set rtp+=/usr/local/opt/fzf
else
    set rtp+=~/.fzf
endif
let g:fzf_tags_command = 'ctags -R'

function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Silver searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore tags'
endif

" force python version to be 3
let g:jedi#force_py_version = 3

set tags=./tags,tags;$HOME
nmap <F8> :TagbarToggle<CR>
set inccommand=nosplit

" Elephant db
let g:sql_type_default = 'pgsql'

" ale
let b:ale_linters = ['flake8']

" swoop
nmap <Leader>l :call Swoop()<CR>
vmap <Leader>l :call SwoopSelection()<CR>
let g:swoopIgnoreCase = 1
let g:swoopAutoInsertMode = 0
let g:defaultWinSwoopHeight = 10

" Grepper
nnoremap ! :GrepperAg --ignore tags 

""""""""""""""""""""""""""""""""""""""
""""""""""""""" GVIM """""""""""""""""
""""""""""""""""""""""""""""""""""""""
set guifont=InconsolataGo\ Nerd\ Font\ Complete:h17
set linespace=6

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
