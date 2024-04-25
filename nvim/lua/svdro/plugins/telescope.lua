--[[
TODO:
 - [ ] can I delete buffers from telescope/nvim-tree?
   - not easily
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
    local trouble = require("trouble.providers.telescope")

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
            ["<leader>xx"] =  trouble.open_with_trouble,
          },
          n = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<Tab>"] = actions.move_selection_worse,
            ["<S-Tab>"] = actions.move_selection_better,
            ["<leader>xx"] =  trouble.open_with_trouble,
          },
        },
      },
    })

    -- load telescope-fzf-native extension
    telescope.load_extension("fzf")

    -- set keymaps
    local keymap = vim.keymap
    local function opts(desc)
      return { desc = "Trouble: " .. desc,  noremap = true, silent = true}
    end

    keymap.set("n", "<leader>fq", builtin.quickfix, opts("Fuzzy find entry in quickfix list"))    -- fyzzy find in quickfix list
    keymap.set("n", "<leader>ff", builtin.find_files, opts("Fuzzy find files in cwd"))            -- fuzzy find files cwd
    keymap.set("n", "<leader>fb", builtin.buffers, opts("Fuzzy find in open buffers"))            -- fuzzy find files in open buffers
    keymap.set("n", "<leader>fr", builtin.oldfiles, opts("Fuzzy find recent files"))              -- fuzzy find recent files
    keymap.set("n", "<leader>fh", builtin.help_tags, opts("Fuzzy find help tags"))                -- fuzzy find help tags
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", opts("Find TODOs"))                   -- find TODOs

    keymap.set("n", "<leader>fc", builtin.grep_string, opts("Find string under cursor in cwd"))   -- find string under cursor in cwd
    keymap.set("n", "<leader>fs", builtin.live_grep, opts("Find string in cwd"))                  -- find string in cwd
    keymap.set("n", "<leader>fo",function()
      builtin.live_grep({ prompt_title = "Live Grep (Buffers)", grep_open_files = true, })
    end, opts("Find string in open buffers"))                                                     -- find string in open buffers


  end,
}

return { todo_comments_config, telescope_config }
