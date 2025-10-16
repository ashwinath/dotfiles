"""""""""""""""""""""""""""""""""""
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
Plug 'tpope/vim-fugitive'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'majutsushi/tagbar'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-repeat'
Plug 'ryanoasis/vim-devicons'
Plug 'lifepillar/pgsql.vim'
Plug 'dense-analysis/ale'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-ingo-library'
Plug 'vim-python/python-syntax'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries gopls@v0.15.3' }
Plug 'hashivim/vim-terraform'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-rhubarb'
Plug 'sebdah/vim-delve'
Plug 'google/vim-jsonnet'
Plug 'chr4/nginx.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rust-lang/rust.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'posva/vim-vue'
Plug 'luckasRanarison/tailwind-tools.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'Quramy/tsuquyomi'
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocInstall coc-json coc-tsserver coc-snippets coc-typos coc-go'}
Plug 'jacoborus/tender.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'sainnhe/everforest'
Plug 'savq/melange-nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'ashwinath/codecompanion.nvim'
Plug 'ravitemer/mcphub.nvim'
Plug 'OXY2DEV/markview.nvim'

call plug#end()

let g:plug_timeout=1000

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
nmap <leader>t :NERDTreeFind<cr>
" Fold with space
nnoremap <space> za
" remap multiple window keys
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F7> :AvanteToggle<CR>

noremap <Up> :resize +3<cr>
noremap <Down> :resize -3<cr>
noremap <Left> :vertical resize -3<cr>
noremap <Right> :vertical resize +3<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"""""""""""""""""""""""""""""""""""
"""""""""""" VIM SETTINGS """""""""
"""""""""""""""""""""""""""""""""""

set diffopt+=vertical
set hidden

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
set relativenumber
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
      \ 'colorscheme': 'selenized_black',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" let me use the damn mouse to resize windows
set mouse=a

" workaround for backspace not working
set bs=2

let delimitMate_expand_cr = 1

"colour scheme

set termguicolors
colorscheme melange

"Snippets
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2

" force python version to be 3
let g:jedi#force_py_version = 3

set tags=./tags,tags;$HOME
nmap <F8> :TagbarToggle<CR>
set inccommand=nosplit

" Elephant db
let g:sql_type_default = 'pgsql'

" ale
let b:ale_linters = ['flake8', 'golangci_lint']

" swoop
nmap <Leader>l :call Swoop()<CR>
vmap <Leader>l :call SwoopSelection()<CR>
let g:swoopIgnoreCase = 1
let g:swoopAutoInsertMode = 0
let g:defaultWinSwoopHeight = 10

nmap ! :RG<CR>
nmap <F7> :CodeCompanionChat<CR>

" yaml
au! BufNewFile,BufReadPost *.{yaml,yaml.tmpl,yml,yml.tmpl} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
" jsonnet
au! BufNewFile,BufReadPost *.{jsonnet} set filetype=jsonnet foldmethod=indent
autocmd FileType jsonnet setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" use RipGrep instead
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case'.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1

let g:delve_backend = "default"
nmap <Leader>b :DlvToggleBreakpoint<CR>
nmap <F5> :DlvTest<CR>

let g:jsonnet_fmt_on_save = 0
let g:indentLine_setConceal = 0

let g:python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3"

let g:rustfmt_autosave = 1
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
let g:python3_host_prog = '/usr/bin/python3'

let g:ale_go_golangci_lint_package=1

"let g:go_gopls_options = ['-remote=auto', '-build.directoryFilters=-**/_extschema,-**/pbswagger']

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

lua << EOF
require("codecompanion").setup({
  strategies = {
    chat = { adapter = 'ollama', inline = 'ollama' },
    inline = { adapter = 'ollama', inline = 'ollama' },
    cmd = { adapter = 'ollama', inline = 'ollama' },
  },
  adapters = {
    http = {
      ollama = function()
        return require('codecompanion.adapters').extend('ollama', {
          name = 'my_ollama_adapter', -- A custom name for your adapter
          schema = {
            model = { default = 'qwen2.5-coder:32b' }, -- Specify your default Ollama model here
          },
        })
      end,
    },
  },
  extensions = {
    mcphub = {
      callback = "mcphub.extensions.codecompanion",
      opts = {
        make_vars = true,
        make_slash_commands = true,
        show_result_in_chat = true
      }
    }
  }
})
EOF

lua << EOF
require("markview").setup({
  preview = {
    filetypes = { "markdown", "codecompanion" },
    ignore_buftypes = {},
  },
})
EOF
