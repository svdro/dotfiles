--[[
TODO:
 - [x] can I delete buffers from telescope/nvim-tree?
   - not easily
 - [ ] maybe need to use workaround for folding
--]]

-- todo-comments
local todo_comments_config = {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    -- do setup
    todo_comments.setup()
  end,
}

-- telescope
local telescope_config = {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",                                        -- collection of common functions
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- improves sorting performance
    "nvim-tree/nvim-web-devicons",                                  -- colors and icons
    "folke/todo-comments.nvim",                                     -- todo-comments
  },
  config = function() 

    -- require stuff
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local builtin = require("telescope.builtin")

    -- do telescope setup
    telescope.setup({
      defaults = {
        path_display = { "smart" },
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<Tab>"] = actions.move_selection_worse,
            ["<S-Tab>"] =  actions.move_selection_better,
          },
          n = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<Tab>"] = actions.move_selection_worse,
            ["<S-Tab>"] = actions.move_selection_better,
          },
        },
      },
    })

    -- load telescope-fzf-native extension
    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap

    keymap.set("n", "<leader>fq", builtin.quickfix, { noremap = true, silent = true, desc = "Fuzzy find entry in quickfix list" })  -- fyzzy find in quickfix list
    keymap.set("n", "<leader>ff", builtin.find_files, { noremap=true, silent = true, desc = "Fuzzy find files in cwd" })            -- fuzzy find files cwd
    keymap.set("n", "<leader>fb", builtin.buffers, { noremap=true, silent = true, desc = "Fuzzy find in open buffers" })            -- fuzzy find files in open buffers
    keymap.set("n", "<leader>fr", builtin.oldfiles, { noremap=true, silent = true, desc = "Fuzzy find recent files" })              -- fuzzy find recent files
    keymap.set("n", "<leader>fh", builtin.help_tags, { noremap=true, silent = true, desc = "Fuzzy find help tags" })                -- fuzzy find help tags
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { noremap = true, silent = true, desc = "Find TODOs" })                 -- find TODOs

    keymap.set("n", "<leader>fs", builtin.live_grep, { noremap=true, silent = true, desc = "Find string in cwd" })                  -- find string in cwd
    keymap.set("n", "<leader>fo",function()
      builtin.live_grep({ prompt_title = "Live Grep (Buffers)", grep_open_files = true, })
    end, { noremap=true, silent=true, desc = "Find string in open buffers" })                                                               -- find in open buffers

    keymap.set("n", "<leader>fc", builtin.grep_string, { noremap = true, silent = true, desc = "Find string under cursor in cwd" }) -- find string under cursor in cwd

  end,
}

return { todo_comments_config, telescope_config }
