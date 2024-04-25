## nvim config

## TODOs:
  - [ ] formatting (black, etc..)
  - [ ] function signature (make sure this works correctly)
  - [ ] plugins
    - [ ]  [gitsigns](https://github.com/lewis6991/gitsigns.nvim) adds git decorations
    - [ ]  [faith/vim-go](https://github.com/fatih/vim-go) go support (not sure I need this on top of lsp)   
    - [ ]  [copilot](https://github.com/github/copilot.vim) github copilot integration
  - [ ] try open source solution for **Copilot**
    - [ ]  [llm.nvim](https://github.com/huggingface/llm.nvim) try this out as an alternative to copilot

## all plugins

#### essentials

  - [nerdcommenter](https://github.com/preservim/nerdcommenter) comment functions so powerfull ...
  - [dressing](https://github.com/stevearc/dressing.nvim) 
    better ui for some nvim core functionalities like **input** and **select** dialogue
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

#### lsp

  *( **mason** is responsible for downloading and managing **language servers**)*

  - [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
    manage external editor tooling like **LSP Servers**
  - [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
    closes gaps between **mason.nvim** and **lspconfig**
  <!--WARNING: pretty sure I'm not using this -->
  - [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
    extends **mason.nvim** to allow for installing third-party tools

  *( **lspconfig** is responsible for setting up the **nvim LSP client**)*

  - [neovim/lspconfig](https://github.com/neovim/nvim-lspconfig) configs for the default **nvim LSP client**
  - [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp/) completion source for the builtin **nvim LSP client**
  - ["hrsh7th/cmp-nvim-lsp-signature-help"](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
    displays function signatures with current parameter emphasized
  - [folke/neodev.nvim](https://github.com/folke/neodev.nvim)
    adds improved functionality to the **lua language server** (for editing nvim config)
    
#### other dependencies
  - [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
    allows **treesitter** to autoclose/ autorename **html** tags (e.g. automatically closes opened html tags)
  - [plenary](https://github.com/nvim-lua/plenary.nvim)
    collection of lua functions that other packages (e.g. **telescope**) use
  - [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
    colors and icons (e.g. **nvim-tree**, **telescope**)

#### other dependencies (not managed by lazy)

  - [ripgrep](https://github.com/BurntSushi/ripgrep)
    - **telescope** uses this for `live_grep` and `grep_string`
    - ```sudo pacman -S ripgrep```
    - ```brew install ripgrep``` 

## Keybindings

#### defaults

  - `<C-o>` - move backward through **jump-list**
  - `<C-i>` - move forward through **jump-list**

#### nvim-tree & telescope

  - `<C-v>` - open files in **vertical split** 
  - `<C-x>` - open files in **horizontal split**
  - `<C-t>` - open files in a **new tab**

#### telescope

  - `<leader>ff` - fuzzy find **files** in **cwd**
  - `<leader>fb` - fuzzy find **files** in **open buffers**
  - `<leader>fr` - fuzzy find **recent files** (**anywhere**)
  - `<leader>fs` - find **string** in **cwd**
  - `<leader>fo` - find **string** in **open buffers**
  - `<leader>fc` - find **string under cursor** in **cwd**
  - `<leader>ft` - find `PERF`, `HACK`, `TODO`, `NOTE`, `FIX`, `WARNING` *(requires **folke/todo-comments**)*
  - `<leader>fh` - **fuzzy find help documentation**
  - `<leader>fq` - **fuzzy find item** in **quickfix list**

#### nvim-tree 

  - `<leader>r` **refresh** file explorer
  - `<leader>ee` **toggle** file explorer
  - `<leader>ef` **toggle** file explorer *(on current file)*
  - `<leader>ec` **collapse** file explorer
  - `<leader>er` **refresh** file explorer

  *(on attach)*

  - `r` - **rename** a file *(shoud rename **open buffers** but NOT **imports**)*
  - `a` - **create** a new file
  - `<leader>en` set **root** to **current node**
  - `<leader>ep` set **root** to **parent node**


#### treesitter 

  - `:InspectTree` - inspect **syntax highlighting**
  - `<leader>k` - **init incremental selection**
  - `<leader>k` - **node incremental**
  - `<leader>j` - **node decremental**
  - `<leader>l` - **node scope incremental** *(sometimes does larger increments than **node decremental**)*

#### nvim-cmp

*(navigate autocomplete popups)*

  - `<C-k>` *or* `<S-Tab>` - select **prev item**
  - `<C-j>` *or* `<Tab>` - select **next item**
  - `<C-u>` - scroll **docs up**
  - `<C-d>` - scroll **docs down**
  - `<C-e>` - **abort**
  - `<C-Space>` - **show** completion suggestions
  - `<CR>` - **confirm** selection

#### **lsp keybindings** 

*(only available when an **lsp client** is attached to the current **buffer**)*

  - `:LSPRestart` - restart lsp
  - `<leader>do` - show **diagnostic** in **current line**
  - `<leader>dn` - jump to **next diagnostic**
  - `<leader>dp` - jump to **prev diagnostic**
  - `<leader>rn` - **smart rename** *(only works reliably within the current buffer)*
  - `<leader>ca` - **show available code actions**
  - `K` - popup documentation for what's under the cursor
  - `gD` - default nvim goto declaration
  - `gr` - fuzzy find **lsp references** *(item under cursor)*
  - `gi` - fuzzy find **lsp implementations** *(item under cursor)*
  - `gd` - fuzzy find **lsp definition** *(item under cursor)*
  - `gt` - fuzzy find **lsp type definition** *(item under cursor)*
  - `<leader>db` - **find disgnostics** *(in current buffer)*

## Notes

#### **mason** *( installs and manages **language servers** )*

- **installed servers**: 
  `cssls`
  `dockerls`
  [`docker_compose_language_service`](https://github.com/microsoft/compose-language-service)
  `html`,
  [`gopls`](https://github.com/golang/tools/blob/master/gopls/README.md)
  [`lua_ls`](https://github.com/LuaLS/lua-language-server),
  [`pyright`](https://github.com/microsoft/pyright),
  [`tsserver`](https://github.com/typescript-language-server/typescript-language-server)
- add a new server:
  1. `:Mason` open up **mason ui**
  2. browse available language servers
  3. add server name to **ensure_installed** in [mason config]("./lua/svdro/plugins/lsp/mason.lua")
  4. should automatically get installed on restart

### Lazy

  - plugins are stored at `~/.local/share/nvim/lazy/`
  - otherwise check: `:echo &runtimepath`
  - include **lazy-lock.json** in version control
  - `:Lazy restore` updates all plugins to the version from the lockfile
