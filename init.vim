""""""""""""""""""""""""""""""""""""""
"""""""""""" VUNDLE """"""""""""""""""
""""""""""""""""""""""""""""""""""""""
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        let iCanHazVundle=0
endif
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'terryma/vim-multiple-cursors'
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'nikvdp/ejs-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'shime/vim-livedown'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'nvie/vim-flake8'
Plugin 'majutsushi/tagbar'

call vundle#end()

"""""""""""""""""""""""""""""""""""
"""""""""""" REMAPS """""""""""""""
"""""""""""""""""""""""""""""""""""
let mapleader=","
inoremap jk <ESC>
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
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

"""""""""""""""""""""""""""""""""""
"""""""""""" VIM SETTINGS """""""""
"""""""""""""""""""""""""""""""""""
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
set incsearch

" show line numbers
set number
set relativenumber

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
let NERDTreeSHowHidden=1
set wrap

" let me use the damn mouse to resize windows
set mouse=a

" workaround for backspace not working
set bs=2

let delimitMate_expand_cr = 1

"colour scheme
colorscheme afterglow
"set background=dark

"Snippets
let g:UltiSnipsExpandTrigger="<F2>"
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
  let g:ackprg = 'ag --vimgrep'
endif

" force python version to be 3
let g:jedi#force_py_version = 3

" I do realise that flake8 and neovim python packages need to be installed
" into the virtual env as well.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\}

set tags=./tags,tags;$HOME
nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""
""""""""""""""" GVIM """""""""""""""""
""""""""""""""""""""""""""""""""""""""
set guifont=InconsolataGo\ Nerd\ Font\ Complete:h17
set linespace=6

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L
