return {
  -- essentials
  "preservim/nerdcommenter", -- comment functions so powerfull, no comment necessary
  "nvim-lua/plenary.nvim", -- collection of lua functions that many other plugins use

  -- colorschemes
  { "folke/tokyonight.nvim", opts = { style = "storm" }, priority = 1002 }, -- tokyonight colorscheme
  { "gruvbox-community/gruvbox", priority = 1001 }, -- gruvbox colorscheme

  -- dressing ( provides an improved ui for some of nvims core functionality )
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  -- indentation
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    main = "ibl",
    opts = { indent = { char = "┊" } },
  },

  -- which-key (suggests shortcuts after 500 ms)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {},
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
      options = {
        mode = "tabs",
        numbers = "ordinal",
        separator_syle = "slant",
        show_duplicate_prefix = false,
        diagnostics = "nvim_lsp",
      },
    },
  },

  -- copilot
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true -- disable tab mapping

      -- set keymaps
      local keymap = vim.keymap
      local function opts(desc, args)
        local defaults = { silent = true, noremap = true, desc = "Copilot: " .. desc }
        return vim.tbl_deep_extend("force", defaults, args or {})
      end

      -- NOTE:
      -- mapping the <leader> key in insert mode (e.g. <leader><tab>) affects
      -- typing behavior (although <leader><tab> is a cool keybinding).
      -- try these for now and change them in the future if needed:
      local args = { expr = true, replace_keycodes = false }
      keymap.set("i", "jj", 'copilot#Accept("<CR>")', opts("accept suggestion", args)) -- accept copilot suggestion
      keymap.set("i", "jL", "<Plug>(copilot-next)", opts("next suggestion", {})) -- next copilot suggestion
      keymap.set("i", "jH", "<Plug>(copilot-previous)", opts("prev suggestion", {})) -- don't use this, just use next to toggle
      keymap.set("i", "jJ", "<Plug>(copilot-dismiss)", opts("dismiss suggestion", {})) -- dismiss copilot suggestion
      keymap.set("i", "JJ", "<Plug>(copilot-suggest)", opts("suggest", {})) -- suggest copilot suggestion
    end,
  },
}
