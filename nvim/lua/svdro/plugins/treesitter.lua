return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- disable diagnostics: Missing required fields in type `TSConfig`: `modules`, `sync_install`, `ignore_install`, `auto_install`
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup({
      highlight = { enable = true }, -- enable syntax highlighting
      indent = { enable = true }, -- enable indentation
      autotag = { enable = true }, -- enable 'nvim-ts-autotag' plugin
      ensure_installed = {
        "c",
        "dockerfile",
        "gitignore",
        "go",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "vim",
        "vimdoc",
        "query",
      },
      additional_vim_regex_highlighting = false, -- additional vim regex highlighting
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>k", -- init incremental selection
          node_incremental = "<leader>k", -- expand to next increment
          scope_incremental = "<leader>l", -- expand to next increment (sometimes expands more)
          node_decremental = "<leader>j", -- shrink to prev increment
        },
      },
    })
  end,
}
