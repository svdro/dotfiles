"==================== VIM-PLUG =======================
" auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Essentials
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'

" Treepicker
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Vim-Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git
Plug 'lewis6991/gitsigns.nvim'


" CMP
Plug 'L3MON4D3/LuaSnip'                       " snippet engine
Plug 'rafamadriz/friendly-snippets'           " a collection of snippets
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'hrsh7th/nvim-cmp'                       " completion engine
Plug 'hrsh7th/cmp-buffer'                     " buffer completions
Plug 'hrsh7th/cmp-path'                       " path completions
Plug 'hrsh7th/cmp-cmdline'                    " cmdline completions
Plug 'hrsh7th/cmp-nvim-lsp'                   " bridge between lsp and cmp
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'    " a working signature_help!

" LSP
Plug 'neovim/nvim-lspconfig' " a collection of configurations for the inbuild LSP client
Plug 'williamboman/nvim-lsp-installer' " automatically installs language servers.
Plug 'jose-elias-alvarez/null-ls.nvim' " allow non-LSP sources to hook into nvim's LSP client for Linting, Formatting, Diagnostics. e.g: Flake8

call plug#end()

"==================== BASICS =======================
set relativenumber
set number
set guicursor=
set colorcolumn=78
set signcolumn=yes
set scrolloff=8 "start scrolling before reaching bottom/top

set hidden
set cmdheight=1
set shortmess+=c
set history=50 "default value is 50

filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab "replaces <tab> with corrsponding spaces
set smartindent
set autoindent

set splitright
set splitbelow

set incsearch
set hlsearch
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

set updatetime=50
set showmatch "show matching parenthesis
set timeoutlen=1000 ttimeoutlen=0 "deal with esc delay


"==================== REMAPS =======================
let mapleader=" "
nnoremap <leader>s :source ~/.config/nvim/init.vim<cr>

" navigation 
nnoremap <C-h> :bprev<cr>
nnoremap <C-l> :bnext<cr>
nnoremap <down> :resize -2<cr>
nnoremap <up> :resize +2<cr>
nnoremap <left> :vertical resize -2<cr>
nnoremap <right> :vertical resize +2<cr>


nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fc :lua require('telescope.builtin').live_grep({ prompt_title="find string in current working directory" })<cr>
nnoremap <leader>fo :lua require('telescope.builtin').live_grep({ prompt_title="find string in open buffers", grep_open_files = true })<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


nnoremap gd :lua vim.lsp.buf.definition()<cr>
nnoremap K :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>vrn :lua vim.lsp.buf.rename( vim.fn.input("rename: ") )<cr>
nnoremap <leader>f :lua vim.lsp.buf.formatting_sync()<cr> 
inoremap <C-s> <cmd>lua vim.lsp.buf.signature_help()<cr>
nnoremap <C-s> <cmd>lua vim.lsp.buf.signature_help()<cr>

nnoremap <leader>do :lua vim.diagnostic.open_float()<cr>
nnoremap <leader>dp :lua vim.diagnostic.goto_prev()<cr>
nnoremap <leader>dn :lua vim.diagnostic.goto_next()<cr>
nnoremap <leader>q :lua vim.diagnostic.setqflist()<cr>

nnoremap <leader>r :call ReloadLSP()<cr>

fun! ReloadLSP()
    lua print("reloading lsp client...")
    lua vim.lsp.stop_client(vim.lsp.get_active_clients())
    lua vim.lsp.start_client()
    ":edit
    ""lua vim.api.nvim_exec(:edit)
endfun

"==================== FOLDING ======================
"set foldcolumn=2
"set foldopen-=block "to prevent { } from opening folds
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview


"==================== AUTO-COMMANDS  =================
"TODO: replace with lsp formatting
"fun! TrimWhitespace()
  "let l:save = winsaveview()
  "keeppatterns %s/\s\+$//e
  "call winrestview(l:save)
"endfun

"augroup TRIM_WHITE_SPACES
  "autocmd!
  "autocmd BufWritePre * :call TrimWhitespace()
"augroup END

"==================== LUA ============================
lua require("config")

"==================== COLOR-SCHEME ===================
set termguicolors

colorscheme gruvbox
"colorscheme lunar
"colorscheme tokyonight
set background=dark

let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ }

lua vim.cmd[[colorscheme tokyonight]]
lua vim.g.tokyonight_style="storm"
lua vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
