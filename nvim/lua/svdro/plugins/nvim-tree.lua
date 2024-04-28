-- check if currently on a no name buffer
local function isCurrBufferNoName()
  local buf_id = vim.api.nvim_get_current_buf()
  local buf_name = vim.api.nvim_buf_get_name(buf_id)
  return buf_name == ""
end

-- nvim-tree on attach function
local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")
  local lib = require("nvim-tree.lib")
  --local view = require("nvim-tree.view")

  -- revert focus to nvim-tree buffer after opening file
  local function open_file_keep_focus(open_file_callback)
    local node = lib.get_node_at_cursor()

    -- open the file and keep focus if node type is "file
    if node and node.type == "file" then
      -- get the original tab_id, and open the file
      local tab_id = vim.api.nvim_get_current_tabpage()
      open_file_callback(node)

      -- restore tab focus before focusing on tree-buffer to avoid issues
      -- with opening files in new tabs
      vim.api.nvim_set_current_tabpage(tab_id)
      api.tree.focus()
      return
    end

    -- revert to default
    api.node.open.vertical(node)
  end

  -- close tree-buffer after opening file
  local function open_file_close_tree(open_file_callback)
    local node = lib.get_node_at_cursor()

    -- revert to default behavior if the node is nil or not of type "file" or
    -- nvim-tree is the only buffer
    if not node or node.type ~= "file" then
      open_file_callback(node)
      return
    end

    -- use vim api rather than "tree.close_in_this_tab" to avoid issues with
    -- openin files in new tabs. e.g. if tree-buffer is closed first and then
    -- a file gets opened in a new tab, we're stuck with a [No Name] tab.
    -- if file is opened before closing tree-buffer, tree-buffer won't get
    -- closed in original tab.
    -- using buffer id always works
    local buf_id = vim.api.nvim_get_current_buf()
    open_file_callback(node)

    -- check if the buffer is still valid. Use api.tree.close_in_this_tab as
    -- a fallback and print a debug message.
    -- There is an edge case in which the buffer becomes invalid. this happens
    -- when tree-buffer is the initial buffer (e.g. nvim .), a new split is
    -- created with telescope, and then api.node.open.edit is called. (if any
    -- other method on api.node.open is called this does not happen)
    if not vim.api.nvim_buf_is_valid(buf_id) then
      print("Nvim-tree: open_file_close_tree (buffer no longer valid)")
      api.tree.close_in_this_tab()
      return
    end

    vim.api.nvim_buf_delete(buf_id, {})
  end

  -- open file in new tab, close tree-buffer
  local function open_edit_close_tree()
    open_file_close_tree(api.node.open.edit)
  end

  -- open file in new tab, close tree-buffer
  local function open_tab_close_tree()
    open_file_close_tree(api.node.open.tab)
  end

  -- open file in new vertical, close tree-buffer
  local function open_vertical_close_tree()
    open_file_close_tree(api.node.open.vertical)
  end

  -- open file in new horizontal, close tree-buffer
  local function open_horizontal_close_tree()
    open_file_close_tree(api.node.open.horizontal)
  end

  -- open file, keep focus on tree-buffer
  local function open_edit_keep_focus()
    open_file_keep_focus(api.node.open.edit)
  end

  -- open file in new tab, keep focus on tree-buffer
  local function open_tab_keep_focus()
    open_file_keep_focus(api.node.open.tab)
  end

  -- open file in new vertical, keep focus on tree-buffer
  local function open_vertical_keep_focus()
    open_file_keep_focus(api.node.open.vertical)
  end

  -- open file in new horizontal, keep focus on tree-buffer
  local function open_horizontal_keep_focus()
    open_file_keep_focus(api.node.open.horizontal)
  end

  -- always add "Nvim-tree" prefix and bufnr to options
  local function opts(desc)
    return { desc = "Nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- set keymaps
  local keymap = vim.keymap
  api.config.mappings.default_on_attach(bufnr)

  -- change tree root
  keymap.set("n", "<leader>en", api.tree.change_root_to_node, opts("change tree root to node")) -- change tree root to node
  keymap.set("n", "<leader>ep", api.tree.change_root_to_parent, opts("change tree root to parent node")) -- change tree root to parent

  -- open files (default: close tree-buffer if possible)
  keymap.set("n", "<CR>", open_edit_close_tree, opts("open file, close tree-buffer")) -- open file (close tree-buffer)
  keymap.set("n", "<C-t>", open_tab_close_tree, opts("open new tab, close tree-buffer")) -- open tab (close tree-buffer)
  keymap.set("n", "<C-v>", open_vertical_close_tree, opts(" open vertical split, close tree-buffer")) -- open vertical split (close tree-buffer)
  keymap.set("n", "<C-x>", open_horizontal_close_tree, opts(" open horizontal split, close tree-buffer")) -- open horizontal split (close tree-buffer)

  -- open files (alt: refocus on nvim-tree)
  keymap.set("n", "<leader><CR>", open_edit_keep_focus, opts("open, keep focus on tree-buffer")) -- open file (keep focus on tree-buffer
  keymap.set("n", "<leader>v", open_vertical_keep_focus, opts("open vertical split, keep focus on tree-buffer")) -- open vertical split (keep focus on nvim-tree buffer)
  keymap.set("n", "<leader>x", open_horizontal_keep_focus, opts("open horizontal split, keep focus on tree-buffer")) -- open horizontal split (keep focus on nvim-tree buffer)
  keymap.set("n", "<leader>t", open_tab_keep_focus, opts("open tab split, keep focus on tree-buffer")) -- open tab split (keep focus on nvim-tree buffer)
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({

      -- on attach
      on_attach = nvim_tree_on_attach,

      view = {
        width = 35,
        relativenumber = true,
      },

      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },

      -- disable window_picker for explorer to work well with window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local tree = require("nvim-tree.api").tree

    local function opts(desc)
      return { desc = "Nvim-tree: " .. desc, noremap = true, silent = true, nowait = true }
    end

    -- toggle file explorer (delete [No Name] buffers if on one)
    keymap.set("n", "<leader>ee", function()
      tree.toggle({ current_window = isCurrBufferNoName() })
    end, opts("toggle file explorer"))

    -- toggle file explorer on current file (delete [No Name] buffers if on one)
    keymap.set("n", "<leader>ef", function()
      tree.toggle({ find_file = true, current_window = isCurrBufferNoName() })
    end, opts("toggle file explorer on current file"))

    -- collapse file explorer
    keymap.set("n", "<leader>ec", tree.collapse_all, opts("collapse file explorer"))

    -- refresh file explorer
    keymap.set("n", "<leader>er", tree.reload, opts("refresh file explorer"))
  end,
}
