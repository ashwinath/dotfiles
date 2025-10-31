local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('terryma/vim-multiple-cursors')
Plug('scrooloose/nerdtree')
Plug('itchyny/lightline.vim')
Plug('itchyny/lightline.vim')
Plug('tomtom/tlib_vim')
Plug('SirVer/ultisnips')
Plug('honza/vim-snippets')
Plug('tpope/vim-surround')
Plug('Raimondi/delimitMate')
Plug('scrooloose/nerdcommenter')
Plug('tpope/vim-fugitive')
Plug('junegunn/fzf', { ['dir'] = vim.fs.normalize('~/.fzf'), ['do'] = './install --all' })
Plug('junegunn/fzf.vim')
Plug('majutsushi/tagbar')
Plug('machakann/vim-highlightedyank')
Plug('tpope/vim-repeat')
Plug('ryanoasis/vim-devicons')
Plug('lifepillar/pgsql.vim')
Plug('dense-analysis/ale')
Plug('inkarkat/vim-mark')
Plug('inkarkat/vim-ingo-library')
Plug('vim-python/python-syntax')
Plug('Yggdroot/indentLine')
Plug('fatih/vim-go', { ['do'] = ':GoUpdateBinaries' })
Plug('hashivim/vim-terraform')
Plug('shumphrey/fugitive-gitlab.vim')
Plug('tpope/vim-rhubarb')
Plug('sebdah/vim-delve')
Plug('google/vim-jsonnet')
Plug('chr4/nginx.vim')
Plug('mustache/vim-mustache-handlebars')
Plug('catppuccin/nvim', { ['as'] = 'catppuccin' })
Plug('shinchu/lightline-gruvbox.vim')
Plug('posva/vim-vue')
Plug('luckasRanarison/tailwind-tools.nvim')
Plug('hrsh7th/nvim-cmp')
Plug('onsails/lspkind-nvim')
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('neovim/nvim-lspconfig')
Plug('Shougo/vimproc.vim', {['do'] = 'make'})
Plug('Quramy/tsuquyomi')
Plug('neoclide/coc.nvim', {['branch'] = 'release', ['do'] = ':CocInstall coc-json coc-tsserver coc-snippets coc-typos coc-go coc-pyright'})
Plug('jacoborus/tender.vim')
Plug('nanotech/jellybeans.vim')
Plug('nvim-lua/plenary.nvim')
Plug('ashwinath/codecompanion.nvim')
Plug('ravitemer/mcphub.nvim')
Plug('OXY2DEV/markview.nvim')
Plug('rebelot/kanagawa.nvim')

vim.call('plug#end')

vim.g.plug_timeout = 1000

-- Leader key
vim.g.mapleader = ","

-- Basic keymaps
-- Insert mode: jk to escape
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Window navigation (normal mode)
vim.keymap.set("n", "<C-h>", "<C-w>h", { remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { remap = true })

-- Vertical resize (normal mode) - note: overrides default <C-v> paste
vim.keymap.set("n", "<C-v>", ":vertical resize +5<CR>", { noremap = true, silent = true })

-- NERDTree toggles (normal mode)
vim.keymap.set("n", "<leader>p", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", ":NERDTreeFind<CR>", { noremap = true, silent = true })

-- Fold toggle with space (normal mode)
vim.keymap.set("n", "<Space>", "za", { noremap = true, silent = true })

-- Alt window navigation (normal mode, silent)
vim.keymap.set("n", "<A-Up>", "<cmd>wincmd k<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Down>", "<cmd>wincmd j<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Left>", "<cmd>wincmd h<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Right>", "<cmd>wincmd l<CR>", { noremap = true, silent = true })

-- Plugin toggles (normal mode)
vim.keymap.set("n", "<F8>", "<cmd>TagbarToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F7>", "<cmd>CodeCompanionChat<CR>", { noremap = true, silent = true })  -- Overrides AvanteToggle

-- Arrow key resizing (normal mode)
vim.keymap.set("n", "<Up>", "<cmd>resize +3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Down>", "<cmd>resize -3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Left>", "<cmd>vertical resize -3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Right>", "<cmd>vertical resize +3<CR>", { noremap = true, silent = true })

-- Command mode: w!! to sudo save
vim.keymap.set("c", "w!!", "w !sudo tee % > /dev/null", { noremap = true, silent = true })

-- fzf.vim mappings (normal mode)
vim.keymap.set("n", ";", "<cmd>Buffers<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", "<cmd>Files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", "<cmd>Tags<CR>", { noremap = true, silent = true })

-- RG mapping (normal mode, assumes :RG command defined below)
vim.keymap.set("n", "!", "<cmd>RG<CR>", { noremap = true, silent = true })

-- Delve mappings (normal mode, assumes delve plugin)
vim.keymap.set("n", "<Leader>b", ":DlvToggleBreakpoint<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F5>", ":DlvTest<CR>", { noremap = true, silent = true })

-- Coc.nvim tab mappings (insert mode)
local function CheckBackspace()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col) == " "
end
vim.keymap.set("i", "<TAB>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#next"](1)
  elseif CheckBackspace() then
    return "<Tab>"
  else
    return vim.fn["coc#refresh"]()
  end
end, { expr = true, silent = true })
vim.keymap.set("i", "<S-TAB>", function()
  if vim.fn["coc#pum#visible"]() == 1 then
    return vim.fn["coc#pum#prev"](1)
  else
    return "<C-h>"
  end
end, { expr = true, silent = true })

-- Options
vim.opt.diffopt:append("vertical")
vim.opt.hidden = true
vim.opt.foldenable = false
vim.cmd("syntax enable")
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.history = 1000
vim.opt.undofile = true
vim.opt.undodir = vim.fs.normalize("~/.vim/undo")
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.backupdir = vim.fs.normalize("~/.vim/backup/")
vim.opt.directory = vim.fs.normalize("~/.vim/backup/")
vim.opt.laststatus = 2
vim.cmd("set t_Co=256")
vim.opt.encoding = "utf-8"
vim.opt.wrap = true
vim.opt.mouse = "a"
vim.opt.backspace = "indent,eol,start"
vim.opt.termguicolors = true
vim.cmd("colorscheme kanagawa")
vim.opt.tags = "./tags,tags;$HOME"
vim.opt.inccommand = "nosplit"

-- Globals
vim.g.python_highlight_all = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeIgnore = { "\\.pyc$" }
vim.g.lightline = {
  colorscheme = "selenized_black",
  active = {
    left = {
      { "mode", "paste" },
      { "gitbranch", "readonly", "filename", "modified" }
    }
  },
  component_function = {
    gitbranch = "FugitiveHead"
  }
}
vim.g.delimitMate_expand_cr = 1
vim.g.UltiSnipsExpandTrigger = "<c-j>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
vim.g.tsuquyomi_disable_quickfix = 1
vim.g.syntastic_typescript_checkers = { "tsuquyomi" }
vim.g.jsx_ext_required = 0
vim.g.fzf_tags_command = "ctags -R"
vim.g.sql_type_default = "pgsql"
vim.g.terraform_align = 1
vim.g.terraform_fmt_on_save = 1
vim.g.delve_backend = "default"
vim.g.jsonnet_fmt_on_save = 0
vim.g.indentLine_setConceal = 0
--vim.g.python3_host_prog = "/Library/Frameworks/Python.framework/Versions/3.11/bin/python3"  -- Last set wins
vim.g.rustfmt_autosave = 1
vim.g.ale_go_golangci_lint_package = 1

-- Conditional FZF runtime path
if vim.fn.has("macunix") == 1 then
  vim.opt.rtp:append("/usr/local/opt/fzf")
else
  vim.opt.rtp:append(vim.fs.normalize("~/.fzf"))
end

-- ALE buffer-local linters (via autocmds; assumes python/go filetypes)
local ale_augroup = vim.api.nvim_create_augroup("ale_linters", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = ale_augroup,
  pattern = "python",
  callback = function()
    vim.b.ale_linters = { "flake8" }
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = ale_augroup,
  pattern = "go",
  callback = function()
    vim.b.ale_linters = { "golangci_lint" }
  end,
})

-- FZF statusline function and autocmd
local function fzf_statusline()
  vim.cmd("highlight fzf1 ctermfg=161 ctermbg=251")
  vim.cmd("highlight fzf2 ctermfg=23 ctermbg=251")
  vim.cmd("highlight fzf3 ctermfg=237 ctermbg=251")
  vim.opt_local.statusline = "%#fzf1# > %#fzf2#fz%#fzf3#f"
end
local fzf_augroup = vim.api.nvim_create_augroup("fzf_statusline", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = fzf_augroup,
  pattern = "FzfStatusLine",
  callback = fzf_statusline,
})

-- TypeScript indentation
local ts_augroup = vim.api.nvim_create_augroup("typescript_indent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = ts_augroup,
  pattern = "typescript",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

-- Suppress bell on GUIEnter (gVim; for Neovim, consider VimEnter if needed)
local gui_augroup = vim.api.nvim_create_augroup("gui_enter", { clear = true })
vim.api.nvim_create_autocmd("GUIEnter", {
  group = gui_augroup,
  command = "set vb t_vb=",
})

-- YAML filetype and indentation
local yaml_augroup = vim.api.nvim_create_augroup("yaml_filetype", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  group = yaml_augroup,
  pattern = { "*.yaml", "*.yaml.tmpl", "*.yml", "*.yml.tmpl" },
  callback = function()
    vim.bo.filetype = "yaml"
    vim.opt_local.foldmethod = "indent"
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = yaml_augroup,
  pattern = "yaml",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- Jsonnet filetype and indentation
local jsonnet_augroup = vim.api.nvim_create_augroup("jsonnet_filetype", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost" }, {
  group = jsonnet_augroup,
  pattern = "*.jsonnet",
  callback = function()
    vim.bo.filetype = "jsonnet"
    vim.opt_local.foldmethod = "indent"
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = jsonnet_augroup,
  pattern = "jsonnet",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

-- JavaScript and Vue indentation
local js_vue_augroup = vim.api.nvim_create_augroup("js_vue_indent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = js_vue_augroup,
  pattern = "javascript",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 0
    vim.opt_local.expandtab = true
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = js_vue_augroup,
  pattern = "vue",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 0
    vim.opt_local.expandtab = true
  end,
})

-- Rusty-tags for Rust
local rust_augroup = vim.api.nvim_create_augroup("rust_tags", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
  group = rust_augroup,
  pattern = "*.rs",
  callback = function()
    vim.opt_local.tags = { "./rusty-tags.vi", "/,$RUST_SRC_PATH/rusty-tags.vi" }
  end,
})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = rust_augroup,
  pattern = "*.rs",
  callback = function()
    local cmd = "!rusty-tags vi --quiet --start-dir=" .. vim.fn.expand("%:p:h") .. " &"
    vim.cmd("silent! exec " .. cmd)
    vim.cmd("redraw!")
  end,
})

-- .vimrc folding (Vim filetype)
local vim_fold_augroup = vim.api.nvim_create_augroup("filetype_vim", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = vim_fold_augroup,
  pattern = "vim",
  callback = function()
    vim.opt_local.foldmethod = "marker"
  end,
})

-- User Commands
-- Custom :Rg with fzf.vim
vim.api.nvim_create_user_command("Rg", function(opts)
  local grep_args = "rg --hidden --column --line-number --no-heading --color=always --smart-case " ..
                    vim.fn.shellescape(opts.args)
  local preview = opts.bang and vim.fn["fzf#vim#with_preview"]("up:60%") or
                  vim.fn["fzf#vim#with_preview"]("right:50%:hidden", "?")
  vim.fn["fzf#vim#grep"](grep_args, 1, preview, opts.bang)
end, { bang = true, nargs = "*" })

-- Custom :Find with ripgrep
vim.api.nvim_create_user_command("Find", function(opts)
  local grep_args = 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" ' ..
                    vim.fn.shellescape(opts.args) .. '| tr -d "\\017"'
  vim.fn["fzf#vim#grep"](grep_args, 1, opts.bang)
end, { bang = true, nargs = "*" })

-- Plugin Lua setups (keep as-is)
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
            model = { default = 'qwen3-coder:30b' }, -- Specify your default Ollama model here
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

require("markview").setup({
  preview = {
    filetypes = { "markdown", "codecompanion" },
    ignore_buftypes = {},
  },
})
