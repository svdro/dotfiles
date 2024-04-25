return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",                                    -- completion source for nvim-lspconfig
    { "folke/neodev.nvim", opts = {} },                        -- improves "lua_ls" language server
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")              -- should have been setup prior to this
    local cmp_nvim_lsp = require("cmp_nvim_lsp")                    -- should have been setup prior to this
    local builtin_ok, builtin = pcall(require, "telescope.builtin") -- should have been setup prior to this

    local keymap = vim.keymap

    -- execute this every time an LSP client attaches to a buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)

        -- define options for keymaps
        local function opts(desc)
          return { desc = desc, buffer = ev.buf, noremap = true, silent = true }
        end

        -- keymaps - diagnostics
        keymap.set("n", "<leader>do", vim.diagnostic.open_float, opts("Show diagnostic in curr line"))      -- show diagnostics for line
        keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts("Go to next diagnostic"))              -- jump to next diagnostic in buffer
        keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts("Go to previous diagnostic"))          -- jump to previous diagnostic in buffer

        -- add the diagnostic under the cursor to the quickfix list
        -- NOTE: this doesn not work as intended (should only add the current diagnostic to quickfix list)
        --keymap.set("n", "<leader>dq", function() vim.diagnostic.setqflist() end, opts("Add the diagnostic under the cursor to quickfix list"))

        -- keymaps - lsp.buf
        keymap.set("n", "K", vim.lsp.buf.hover, opts("Show documentation"))                           -- show documentation (word under cursor)
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))                     -- goto declarations
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Smart Rename"))                       -- smart rename
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("See available code actions"))    -- see available code actions

        -- keymaps - telescope
        if not builtin_ok then
          print("LspAttach: cannot attach telescope.builtin keybindings")
          return
        end

        -- fuzzy find lsp references (occurences of the item under cursor)
        keymap.set("n", "gr", builtin.lsp_references, opts("Fuzzy find lsp references"))                                                        -- fuzzy find lsp references

        -- fuzzy find lsp implementations (item under cursor)
        keymap.set("n", "gi", function() builtin.lsp_implementations( { jump_type = "never" } ) end, opts("Fuzzy find lsp implementations"))                                                        -- fuzzy find lsp references

        -- fuzzy find lsp definition (item under the cursor)
        keymap.set("n", "gd", function() builtin.lsp_definitions( { jump_type = "never" } ) end, opts("Fuzzy find lsp definition"))

        -- fuzzy find lsp type definition (item under cursor)
        keymap.set("n", "gt", function() builtin.lsp_type_definitions( { jump_type = "never" } ) end, opts("Fuzzy find lsp type definition"))

        -- show all diagnostics for the current file (bufnr=0 means current buffer)
        keymap.set("n", "<leader>db", function() builtin.diagnostics( { bufnr = 0 } ) end, opts("Fuzzy find diagnostics"))

        -- TODO:  create keymaps for different severity levels across all open buffers
        -- 
        --keymap.set("n", "<leader>DE", function() builtin.diagnostics( { bufnr = nil, severity = vim.diagnostic.severity.E } ) end, opts("Fuzzy find diagnostics"))

      end,
    })


    -- used to enable autocompletion (assign to every server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- change the diagnostics symbols in the sign column
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      -- configure lua server (with special settings)
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
    })
  end,
}
