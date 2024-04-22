# nvim

### TODO:
 - [ ] maybe move all keymaps to the same place
 - [ ] maybe switch to nvim nightly (e.g. **treesitter**)
 - [ ] maybe find an open source solution for replacing **copilot** with **ollama** 
 - [ ]  [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
   adds git decorations
 - [ ]  [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
   really nice syntax highlighting
 - [ ]  [copilot](https://github.com/github/copilot.vim)
   github copilot integration
 - [ ]  [lsp](https://github.com/neovim/nvim-lspconfig) lsp
   - [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
   - ...

### plugins

 - [tokyonight](https://github.com/folke/tokyonight.nvim) tokyonight colorscheme
 - [gruvbox](https://github.com/gruvbox-community) gruvbox colorscheme
 - [nerdcommenter](https://github.com/preservim/nerdcommenter) comment functions so powerfull ...
 - [bufferline](https://github.com/akinsho/bufferline.nvim) make tab pages look nicer
 - [lualine](https://github.com/nvim-lualine/lualine.nvim) status line for nvim
 - [which-key](https://github.com/folke/which-key.nvim) displays a popup with keybindings
 - [telescope](https://github.com/nvim-telescope/telescope.nvim/tree/0.1.x) fuzzy finder for files
 - [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) file explorer

### plugin dependencies
 - [plenary](https://github.com/nvim-lua/plenary.nvim)
   collection of lua functions that other packages (e.g. **telescope**) use
 - [telescope-fzf-native](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
   improves sorting performance for **telescope**
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
 - **nvim-tree** 
     - `r` rename a file *nvim-tree* (renames open buffers)
     - `a` create a new file
