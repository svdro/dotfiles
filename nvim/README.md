## nvim config

### TODO:
 - [ ] figure out folding (maybe use treesitter for folding)
 - [x] maybe move all keymaps to the same place
   - seems unpractical
 - [ ] maybe switch to nvim nightly (e.g. **treesitter**)
 - [ ] maybe find an open source solution for replacing **copilot** with **ollama** 
 - [ ]  [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
 - [ ]  [faith/vim-go](https://github.com/fatih/vim-go) go support (not sure I need this on top of lsp)   
   adds git decorations
 - [ ]  [copilot](https://github.com/github/copilot.vim)
 - [ ]  [llm.nvim](https://github.com/huggingface/llm.nvim) try this out as an alternative to copilot
   github copilot integration
 - [ ] autocomplete
 - [ ]  [lsp](https://github.com/neovim/nvim-lspconfig) lsp
   - [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
   - ...

### plugins

#### essentials

 - [nerdcommenter](https://github.com/preservim/nerdcommenter) comment functions so powerfull ...
 - [tokyonight](https://github.com/folke/tokyonight.nvim) tokyonight colorscheme
 - [gruvbox](https://github.com/gruvbox-community) gruvbox colorscheme
 - [bufferline](https://github.com/akinsho/bufferline.nvim) make tab pages look nicer
 - [lualine](https://github.com/nvim-lualine/lualine.nvim) status line for nvim
 - [which-key](https://github.com/folke/which-key.nvim) displays a popup with keybindings
 - [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) syntax highlighting
 - [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) 
   adds indentation guides to nvim

#### navigation

 - [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) file explorer
 - [telescope](https://github.com/nvim-telescope/telescope.nvim/tree/0.1.x) fuzzy finder for files
 - [folke/todo-comments](https://github.com/folke/todo-comments.nvim) highlight and search comments like 
   `TODO`, `NOTE`, etc. Really cool integration with **telescope**    
 - [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
   improves sorting performance for **telescope**

#### autocomplete

   - [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) completion engine plugin
   - [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer/) completion source for text in bufffer
   - [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) completion source for file system paths
   - [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) snippet engine 
   - [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) 
     snippet engine (should be added as a dependency for **LuaSnip**)
   - [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) completion source for **LuaSnip**
   - [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim) vs-code like pictograms


#### other dependencies
 - [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
   allows **treesitter** to autoclose/ autorename **html** tags (e.g. automatically closes opened html tags)
 - [plenary](https://github.com/nvim-lua/plenary.nvim)
   collection of lua functions that other packages (e.g. **telescope**) use
 - [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
   colors and icons (e.g. **nvim-tree**, **telescope**)


### other dependencies

  - [ripgrep](https://github.com/BurntSushi/ripgrep)
    - **telescope** uses this for `live_grep` and `grep_string`
    - ```sudo pacman -S ripgrep```
    - ```brew install ripgrep``` 

### keybindings
  - **nvim-tree** & **telescope**
    - `<C-v>` open files in vertical split (**nvim-tree**, **telescope**)
    - `<C-x>` open files in horizontal split (**nvim-tree**, **telescope**)
    - `<C-t>` open files in a new tab (**nvim-tree**, **telescope**)
  - **telescope**
    - `<leader>ff` fuzzy find files in cwd
    - `<leader>fb` fuzzy find files in open buffers
    - `<leader>fr` fuzzy find recent files (anywhere)
    - `<leader>fs` find string in cwd
    - `<leader>fo` find string in open buffers
    - `<leader>fc` find string under cursor in cwd
    - `<leader>ft` find `PERF`, `HACK`, `TODO`, `NOTE`, `FIX`, `WARNING` (requires **folke/todo-comments**)
    - `<leader>fh` fuzzy find help documentation
  - **nvim-tree** 
    - `r` rename a file *nvim-tree* (renames open buffers)
    - `a` create a new file
  - **treesitter** 
    - `:InspectTree` inspect the syntax highlighting
    - `<leader>k` init incremental selection
    - `<leader>k` node incremental
    - `<leader>j` node decremental
    - `<leader>l` node scope incremental (*sometimes does larger increments*)
  - **nvim-cmp** 
    - `<C-k>` *or* `<S-Tab>` select prev item
    - `<C-j>` *or* `<Tab>` select inext item
    - `<C-u>` scroll docs up
    - `<C-d>` scroll docs down
    - `<C-e>` abort
    - `<C-Space>` show completion suggestions
    - `<CR>` confirm selection
  - **default nvim keybindings**
    - `<C-o>` move backward through **jump-list**
    - `<C-i>` move forward through **jump-list**


### Notes
  - **Lazy**
    - include **lazy-lock.json** in version control
    - `:Lazy restore` updates all plugins to the version from the lockfile
