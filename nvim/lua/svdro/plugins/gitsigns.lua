return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")

    -- do setup
    gitsigns.setup({
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },

      on_attach = function(bufnr)
        -- set keymaps
        local keymap = vim.keymap

        local function opts(desc)
          return { desc = "Gitsigns: " .. desc, buffer = bufnr, noremap = true, silent = true }
        end

        -- navigation
        keymap.set("n", "<leader>hn", gitsigns.next_hunk, opts("jump to next hunk")) -- "jump to next hunk"
        keymap.set("n", "<leader>hp", gitsigns.prev_hunk, opts("jump to prev hunk")) -- "jump to prev hunk"

        -- actions (hunk)
        keymap.set("n", "<leader>hs", gitsigns.stage_hunk, opts("stage hunk")) -- "stage hunk"
        keymap.set("n", "<leader>hr", gitsigns.reset_hunk, opts("reset hunk")) -- "reset hunk"
        keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, opts("undo stage hunk")) -- "undo stage hunk"
        keymap.set("n", "<leader>hP", gitsigns.preview_hunk, opts("preview hunk")) -- "preview hunk"
        keymap.set("n", "<leader>hq", gitsigns.setqflist, opts("populate the quickfix list with hunks")) -- populate the quickfix list with hunks

        -- actions (buffer)
        keymap.set("n", "<leader>hS", gitsigns.stage_buffer, opts("stage buffer")) -- "stage buffer"
        keymap.set("n", "<leader>hR", gitsigns.reset_buffer, opts("reset buffer")) -- "reset buffer"

        -- blame
        keymap.set("n", "<leader>hB", gitsigns.toggle_current_line_blame, opts("toggle current line blame")) -- "toggle current line blame (ghost text)"
        keymap.set("n", "<leader>hb", function()
          gitsigns.blame_line({ full = true })
        end, opts("blame current line")) -- "blame current line"

        -- diff
        keymap.set("n", "<leader>hd", function()
          gitsigns.diffthis("HEAD~", { split = "belowright" })
        end, opts("perform a vimdiff on the given file")) -- perform a vimdiff on the given file
      end,
    })
  end,
}
