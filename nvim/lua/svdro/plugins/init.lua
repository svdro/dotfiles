return {
  -- essentials
  "preservim/nerdcommenter", -- comment functions so powerfull, no comment necessary
  "nvim-lua/plenary.nvim", -- collection of lua functions that many other plugins use

  -- colorschemes
  { "folke/tokyonight.nvim", priority = 1002, }, -- tokyonight colorscheme
  { "gruvbox-community/gruvbox", priority = 1001, }, -- gruvbox colorscheme

  -- which-key (suggests shortcuts after 500 ms)
  { "folke/which-key.nvim", event = "VeryLazy", init = function() 
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end, opts = {}, },

  -- bufferline
  { 
    "akinsho/bufferline.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*", opts = { 
      options = { mode = "tabs", numbers = "buffer_id", separator_syle = "slant", },
    },
  },
}
