-- trouble (v2)
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },

  config = function()
    -- require trouble
    local trouble = require("trouble")

    -- do setup
    trouble.setup({
      position = "bottom",
      height = 20,
      auto_fold = true, -- automatically fold a file trouble list at creation
      use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
    })

    -- set keymaps
    local keymap = vim.keymap
    local function opts(desc)
      return { desc = "Trouble: " .. desc, noremap = true, silent = true }
    end

    -- toggle trouble list
    keymap.set("n", "<leader>xx", trouble.toggle, opts("toggle trouble list"))

    -- toggle workspace diagnostics
    keymap.set("n", "<leader>xw", function()
      trouble.toggle("workspace_diagnostics")
    end, opts("toggle workspace diagnostics"))

    -- toggle document diagnostics
    keymap.set("n", "<leader>xd", function()
      trouble.toggle("document_diagnostics")
    end, opts("toggle document diagnostics"))

    -- toggle quickfix list
    keymap.set("n", "<leader>xq", function()
      trouble.toggle("quickfix")
    end, opts("toggle quickfix list"))

    -- toggle loclist
    keymap.set("n", "<leader>xl", function()
      trouble.toggle("loclist")
    end, opts("toggle loclist"))

    -- toggle todo list
    keymap.set("n", "<leader>xt", function()
      trouble.toggle("todo")
    end, opts("toggle todo list"))

    -- toggle lsp references
    keymap.set("n", "gR", function()
      trouble.toggle("lsp_references")
    end, opts("toggle lsp references"))
  end,
}

---- trouble (v3)
--return {
--"folke/trouble.nvim",
--dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
--branch = "dev", -- IMPORTANT!
--keys = {
--{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
--{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
--{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
--{ "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
--{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
--{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
--},
--opts = {}, -- for default options, refer to the configuration section for custom setup.
--}
