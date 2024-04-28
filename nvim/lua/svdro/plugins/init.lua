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

  ---- which-key (suggests shortcuts after 500 ms)
  --{
  --"folke/which-key.nvim",
  --event = "VeryLazy",
  --init = function()
  --vim.o.timeout = true
  --vim.o.timeoutlen = 500
  --end,
  --opts = {},
  --},

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
      -- HACK:
      -- this is a workaround for the fact that the plugin does not provide
      -- a lua api, and there's some issue that has to do with how escape sequences
      -- are handled in lua when using the vim.api.nvim_set_keymap function.
      -- TODO:
      -- when <leader><tab> is enabled, typing spaces in insert mode is slow.
      -- this is because the plugin is waiting for the keybinding to be resolved.
      -- maybe there's a way to resolve this issue.
      -- find keybinding for prev, next that don't conflict with cmp.
      vim.cmd('imap <silent><script><expr> <leader><tab> copilot#Accept("<CR>")')
      vim.cmd("inoremap <C-k>  <Plug>(copilot-next)")
      vim.cmd("inoremap <C-j>  <Plug>(copilot-previous)")
      vim.cmd("inoremap <C-}>  <Plug>(copilot-dismiss)")
      vim.cmd("inoremap <C-{>  <Plug>(copilot-suggest)")
      --vim.keymap.set( "i", "<leader><tab>", "copilot#Accept(\"<CR>\")", { script = true, expr = true, silent = true, noremap = true })
    end,
  },
}
