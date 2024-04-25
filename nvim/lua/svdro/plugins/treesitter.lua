return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup( {
      highlight = { enable = true, }, -- enable syntax highlighting
      indent = { enable = true, },    -- enable indentation
      autotag = { enable = true, },   -- enable 'nvim-ts-autotag' plugin
      ensure_installed = {
        "c",
        "dockerfile",
        "gitignore",
        "go",
        "json",
        "lua", 
        "python",
        "vim",
        "vimdoc",
        "query",
      },
      incremental_selection = {
        enable = true,
	keymaps = {
	  init_selection = "<leader>k",  	-- init incremental selection
	  node_incremental = "<leader>k", 	-- expand to next increment
	  scope_incremental = "<leader>l", 	-- expand to next increment (sometimes expands more)
	  node_decremental = "<leader>j", 	-- shrink to prev increment
	},
      },
    } )
  end,
}
