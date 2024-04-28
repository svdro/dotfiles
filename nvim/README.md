## nvim config

## TODOs:

- [ ] plugins
  - [ ] [faith/vim-go](https://github.com/fatih/vim-go) go support (not sure I need this on top of lsp)
- [ ] **Copilot** replacement
  - the official copilot plugin does not have nice integration with **cmp** (also sucks otherwise)
  - [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua?ref=tamerlan.dev) unofficial, might be better
  - [llm.nvim](https://github.com/huggingface/llm.nvim) alternative to copilot

## all plugins

#### essentials

- [nerdcommenter](https://github.com/preservim/nerdcommenter) comment functions so powerfull ...
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim) adds git decorations
- [dressing](https://github.com/stevearc/dressing.nvim)
- [copilot](https://github.com/github/copilot.vim) official plugin
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
  `TODO`, `NOTE`, etc. Really cool integrations with **telescope** and **trouble**
- [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
  opens lists for navigating **todos**, **quickfixes**, **diagnostics**, etc
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
- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) lightweight formatter for nvim

#### lsp

_( **mason** is responsible for downloading and managing **language servers**)_

- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
  manage external editor tooling like **LSP Servers**
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
  closes gaps between **mason.nvim** and **lspconfig**
- [WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
  extends **mason.nvim** to allow for installing third-party tools (e.g. formatters)

_( **lspconfig** is responsible for setting up the **nvim LSP client**)_

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
  - `sudo pacman -S ripgrep`
  - `brew install ripgrep`

## Keybindings

#### defaults

- `<C-o>` - move backward through **jump-list**
- `<C-i>` - move forward through **jump-list**

#### copilot

- `<leader><tab>` - accept **copilot** suggestion _(to avoid conflicts with **cmp**)_

#### gitsigns

- `<leader>hn` - **next hunk**
- `<leader>hp` - **prev hunk**

- `<leader>hs` - **stage hunk** _(NOTE: format before staging)_
- `<leader>hu` - **undo stage** hunk _( can only undo **stage hunk**, not **stage buffer**)_
- `<leader>hr` - **reset hunk** to last committed state _( or last staged state if hunks have been staged since last commit )_
- `<leader>hq` - populate **quickfix** with hunk
- `<leader>hP` - **preview hunk** _( floating window )_

- `<leader>hS` - **stage buffer** _(NOTE: format before staging)_
- `<leader>hR` - **reset buffer** to last committed state _( or last staged state if hunks have been staged since last commit )_

- `<leader>hb` - **blame** current line _( floating window )_
- `<leader>hB` - **toggle** current line **blame** _(ghost text)_

- `<leader>hd` - perform a `vimdiff` on the given file with _base_ **Head~**

- `:Gitsigns show {base}` - show _**revision base**_ of the current file
- `:Gitsigns diffthis {base}` - perform a `vimdiff` on the given file with **{base}** (e.g. `:Gitsigns diffthis Head~`)

#### nvim-tree & telescope

- `<C-v>` - open files in **vertical split**
- `<C-x>` - open files in **horizontal split**
- `<C-t>` - open files in a **new tab**

#### nvim-tree

- `<leader>r` **refresh** file explorer
- `<leader>ee` **toggle** file explorer
- `<leader>ef` **toggle** file explorer _(on current file)_
- `<leader>ec` **collapse** file explorer
- `<leader>er` **refresh** file explorer

_( on nvim-tree attach )_

- `r` - **rename** a file _(shoud rename **open buffers** but NOT **imports**)_
- `a` - **create** a new file
- `<leader>en` set **root** to **current node**
- `<leader>ep` set **root** to **parent node**
- `<leader>` + `v`, `x`, `t` open **vertical**, **horizontal**, **tab** _(close **tree-buffer**)_
- `<C>` + `v`, `x`, `t` open **vertical**, **horizontal**, **tab** _(keep focus on **tree-buffer**)_

#### telescope

- `<leader>ff` - fuzzy find **files** in **cwd**
- `<leader>fb` - fuzzy find **files** in **open buffers**
- `<leader>fr` - fuzzy find **recent files** (**anywhere**)
- `<leader>fs` - find **string** in **cwd**
- `<leader>fo` - find **string** in **open buffers**
- `<leader>fc` - find **string under cursor** in **cwd**
- `<leader>ft` - find `PERF`, `HACK`, `TODO`, `NOTE`, `FIX`, `WARNING` _(requires **folke/todo-comments**)_
- `<leader>fh` - **fuzzy find help documentation**
- `<leader>fq` - **fuzzy find item** in **quickfix list**

_( on telescope attach )_

- `<leader>xx` - open with trouble

#### trouble

- `<leader>xx` - toggle **trouble** list _(last used list)_
- `<leader>xw` - toggle **workspace diagnostics** list
- `<leader>xd` - toggle **document diagnostics** list _(diagnostics in current buffer)_
- `<leader>xq` - toggle **quickfix** list
- `<leader>xl` - toggle **loclist**
- `<leader>xt` - toggle **todo** list (e.g. `PERF`, `HACK`, `TODO`, `NOTE`, `FIX`, `WARNING`)

_( on lsp attach )_

- `<leader>gR` - toggle **lsp references** list

#### treesitter

- `:InspectTree` - inspect **syntax highlighting**
- `<leader>k` - **init incremental selection**
- `<leader>k` - **node incremental**
- `<leader>j` - **node decremental**
- `<leader>l` - **node scope incremental** _(sometimes does larger increments than **node decremental**)_

#### nvim-cmp

_(navigate autocomplete popups)_

- `<C-k>` _or_ `<S-Tab>` - select **prev item**
- `<C-j>` _or_ `<Tab>` - select **next item**
- `<C-u>` - scroll **docs up**
- `<C-d>` - scroll **docs down**
- `<C-e>` - **abort**
- `<C-Space>` - **show** completion suggestions
- `<CR>` - **confirm** selection
- `<leader>FF` - format current buffer with **conform**

#### lsp keybindings

_(only available when an **lsp client** is attached to the current **buffer**)_

- `:LSPRestart` - restart lsp
- `<leader>do` - show **diagnostic** in **current line**
- `<leader>dn` - jump to **next diagnostic**
- `<leader>dp` - jump to **prev diagnostic**
- `<leader>rn` - **smart rename** _(only works reliably within the current buffer)_
- `<leader>ca` - **show available code actions**
- `K` - popup documentation for what's under the cursor
- `gD` - default nvim goto declaration
- `gr` - fuzzy find **lsp references** _(item under cursor)_
- `gi` - fuzzy find **lsp implementations** _(item under cursor)_
- `gd` - fuzzy find **lsp definition** _(item under cursor)_
- `gt` - fuzzy find **lsp type definition** _(item under cursor)_
- `<leader>db` - **find disgnostics** _(in current buffer)_

## Notes

#### mason _( installs and manages **language servers**, **formatters**, etc... )_

- **installed servers**:
  `cssls`
  `dockerls`
  [`docker_compose_language_service`](https://github.com/microsoft/compose-language-service)
  `html`,
  [`gopls`](https://github.com/golang/tools/blob/master/gopls/README.md)
  [`lua_ls`](https://github.com/LuaLS/lua-language-server),
  [`pyright`](https://github.com/microsoft/pyright),
  [`tsserver`](https://github.com/typescript-language-server/typescript-language-server)
- **installed formatters**:
  [`black`](https://pypi.org/project/black/)
  [`isort`](https://pypi.org/project/isort/)
  [`golines`](https://github.com/segmentio/golines)
  [`gofumpt`](https://github.com/mvdan/gofumpt)
  [`prettier`](https://github.com/prettier/prettier)
  [`stylua`](https://github.com/JohnnyMorganz/StyLua)

- add a new **language server**/ **formatter**:
  1. `:Mason` open up **mason ui**
  2. browse available language servers
  3. add server name to **ensure_installed** in [mason config]("./lua/svdro/plugins/lsp/mason.lua")
  4. should automatically get installed on restart

#### lazy.nvim _( plugin manager )_

- plugins should be stored at `~/.local/share/nvim/lazy/`
- otherwise check: `:echo &runtimepath`
- include **lazy-lock.json** in version control
- `:Lazy restore` updates all plugins to the version from the lockfile
