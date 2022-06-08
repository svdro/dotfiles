"==================== VIM-PLUG =======================
" auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Optics
Plug 'gruvbox-community/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'

" Treepicker
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Vim-Go
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Telescope
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope-fzy-native.nvim'
"Plug 'nvim-telescope/telescope.nvim'

" CMP
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip'

"Plug 'onsails/lspkind-nvim' "lspkind adds pictograms to nvim lsp
"Plug 'hrsh7th/cmp-nvim-lsp' " cmp is the completion engine
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/nvim-cmp'


" LSP

"Plug 'neovim/nvim-lspconfig' "a collection of configurations for the inbuild LSP client

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
set nohlsearch "highlight found words

set updatetime=50
set showmatch "show matching parenthesis
set timeoutlen=1000 ttimeoutlen=0 "deal with esc delay


"==================== REMAPS =======================
let mapleader=" "
nnoremap <leader>s :source ~/.config/nvim/init.vim<cr>

"" telescope
"nnoremap <leader>ps :lua require("telescope.builtin").grep_string({ search = vim.fn.input("Grep For > ")})<cr>
"nnoremap <leader>pf :lua require('telescope.builtin').live_grep({ prompt_title = 'find string in open buffers...', grep_open_files = true })<cr>

"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg :lua require('telescope.builtin').live_grep({ prompt_title = 'find string in open buffers...', grep_open_files = true })<cr>
"nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"" lsp
""nnoremap <leader>rel vim.lsk.stop_client(vim.lsp.get_active_clients())<cr>
"nnoremap gd :lua vim.lsp.buf.definition()<cr>
"nnoremap K :lua vim.lsp.buf.hover()<cr>
"nnoremap <leader>vrn :lua vim.lsp.buf.rename( vim.fn.input("rename: ") )<cr>
"nnoremap <leader>vd :lua vim.diagnostic.open_float()<cr>
"nnoremap <leader>vca :lua vim.lsp.buf.code_action()<cr>
"nnoremap <leader>f :lua vim.lsp.buf.formatting()<cr>
"inoremap <C-s> <cmd>lua vim.lsp.buf.signature_help()<cr>


"==================== FOLDING ======================
"set foldcolumn=2
"set foldopen-=block "to prevent { } from opening folds
"autocmd BufWinLeave *.* mkview!
"autocmd BufWinEnter *.* silent loadview


"==================== AUTO-COMMANDS  =================
"TODO: replace with lsp formatting
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup TRIM_WHITE_SPACES
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

"
"==================== LUA ============================
"lua require("tele")
"lua require("lsp")
"lua require("treesitter")


"==================== COLOR-SCHEME ===================
colorscheme gruvbox
set background=dark
let g:lightline = {'colorscheme': 'gruvbox'}

"==================== EXPERIMENTS =-==================
