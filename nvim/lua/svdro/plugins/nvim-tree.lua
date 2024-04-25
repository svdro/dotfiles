-- check if currently on a no name buffer
local function isCurrBufferNoName()
  local buf_id = vim.api.nvim_get_current_buf()
  local buf_name = vim.api.nvim_buf_get_name(buf_id)
  return buf_name == ""
end

-- check if nvim-tree is the only buffer in the current tab
local function isNvimTreeOnlyBuffer()
    local buffers = vim.api.nvim_list_bufs()
    local visible_buffers = 0

    for _, buf in pairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.fn.bufwinnr(buf) > 0 then
            visible_buffers = visible_buffers + 1
        end
    end

    return visible_buffers == 1 and vim.bo.filetype == 'NvimTree'
end

-- nvim-tree on attach function
local function nvim_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")
  local lib = require("nvim-tree.lib")
  local view = require("nvim-tree.view")

  -- always add "Nvim-tree" prefix and bufnr to options
  local function opts(desc)
    return { desc = "Nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- utility for reverting focus to nvim-tree buffer after opening file
  local function open_file_keep_focus(open_file_callback)
    local node = lib.get_node_at_cursor()

    -- open the file and keep focus if node type is "file
    if node and node.type == "file" then
      open_file_callback(node)
      api.tree.focus()
      return
    end

    -- revert to default 
    api.node.open.vertical(node)
  end

  -- set keymaps
  local keymap = vim.keymap
  api.config.mappings.default_on_attach(bufnr)

  -- change tree root to node
  keymap.set("n", "<leader>en", api.tree.change_root_to_node, opts("change tree root to node"))

  -- change tree root to parent
  keymap.set("n", "<leader>ep", api.tree.change_root_to_parent, opts("change tree root to parent node"))

  -- open file but keep focus
  keymap.set("n", "<CR>", function()
    open_file_keep_focus(api.node.open.edit)
  end, opts("open file, keep focus on file explorer"))

  -- open in new vertical split (refocus on nvim-tree buffer)
  keymap.set("n", "<C-v>", function()
    open_file_keep_focus(api.node.open.vertical)
  end ,opts('open file in new vertical split, keep focus on file explorer'))

  -- open in new horizontal split (refocus on nvim-tree buffer)
  keymap.set("n", "<C-x>", function()
    open_file_keep_focus(api.node.open.horizontal)
  end ,opts('open file in new horizontal split, keep focus on file explorer'))

  -- open in new tab (close nvim-tree buffer unless it's the only tab)
  keymap.set('n', '<C-t>', function()
    local node = lib.get_node_at_cursor()

    -- open file in new tab and close nvim-tree buffer
    -- if there are other buffers open in current tab
    if node and node.type == "file" and not isNvimTreeOnlyBuffer() then
      -- nvim-tree buffer needs to be closed first
      view.close()
      api.node.open.tab(node)
      return
    end

    -- revert to default if the node is nil or not of type "file" or 
    -- nvim-tree is the only buffer
    api.node.open.tab(node)

  end ,opts('Help'))

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
      return { desc = "Nvim-tree: " .. desc,  noremap = true, silent = true, nowait = true }
    end


    -- toggle file explorer (delete [No Name] buffers if on one)
    keymap.set("n", "<leader>ee", function()
      tree.toggle( { current_window = isCurrBufferNoName() } )
    end, opts( "toggle file explorer" ))

    -- toggle file explorer on current file (delete [No Name] buffers if on one)
    keymap.set("n", "<leader>ef", function()
      tree.toggle( { find_file = true, current_window = isCurrBufferNoName() } )
    end, opts( "toggle file explorer on current file" ))

    -- collapse file explorer
    keymap.set("n", "<leader>ec", tree.collapse_all, opts( "collapse file explorer" ))

    -- refresh file explorer
    keymap.set("n", "<leader>er", tree.reload, opts( "refresh file explorer" ))
  end
}
