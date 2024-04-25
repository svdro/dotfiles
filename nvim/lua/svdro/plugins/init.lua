return {
  -- essentials
  "preservim/nerdcommenter", -- comment functions so powerfull, no comment necessary
  "nvim-lua/plenary.nvim", -- collection of lua functions that many other plugins use

  -- colorschemes
  { "folke/tokyonight.nvim",  opts = { style = "storm" }, priority = 1002, }, -- tokyonight colorscheme
  { "gruvbox-community/gruvbox",  priority = 1001, }, -- gruvbox colorscheme

  -- dressing ( provides an improved ui for some of nvims core functionality )
  { "stevearc/dressing.nvim", event = "VeryLazy", },

  -- indentation
  { "lukas-reineke/indent-blankline.nvim", event = { "BufReadPre", "BufNewFile" },
    main = "ibl", opts = { indent = { char = "┊" }, },
  },

  -- which-key (suggests shortcuts after 500 ms)
  { "folke/which-key.nvim", event = "VeryLazy", init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end, opts = {}, },

  -- bufferline
  {
    "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*", opts = {
      options = { mode = "tabs", numbers = "ordinal", separator_syle = "slant", show_duplicate_prefix = false, diagnostics = "nvim_lsp" },
    },
  },
}
