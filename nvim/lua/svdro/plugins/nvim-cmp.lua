-- check if the cursor is at the start of the line, or the character before
-- the cursor is a white space
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end       

return {
  "hrsh7th/nvim-cmp", 
  event = "InsertEnter", -- only load the first time we go into insert mode
  dependencies = {
    "hrsh7th/cmp-buffer",                                                       -- completion source for text in bufffer
    "hrsh7th/cmp-path",                                                         -- completion source for file system paths
    { "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp", }, -- snippet engine
    "https://github.com/rafamadriz/friendly-snippets",                          -- more snippets
    "saadparwaiz1/cmp_luasnip",                                                 -- completion source for LuaSnip
    "onsails/lspkind.nvim",                                                     -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- load vs-code style snippets from  installed sources (e.g. friendly snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({

      ---- maybe use this instead of completion = {}
      --window = {
        ----documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, },
        ----completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, },
        --completion = cmp.config.window.bordered(),
        --documentation = cmp.config.window.bordered(),
      --},

      -- setup completion behavior
      completion = {
        completeopt = "menu,menuone,preview,noselect"
      },

      -- configure how nvim-cmp interacts with the snippet engine 
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      -- mappings
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),         -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(),         -- next suggestion
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),            -- scroll docs up
        ['<C-d>'] = cmp.mapping.scroll_docs(4),             -- scroll docs down
        ['<C-Space>'] = cmp.mapping.complete(),             -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(),                    -- close completion window
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)          -- next suggestion (only when cmp popup is open)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif check_backspace() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)        -- previous suggestion (only when cmp popup is open)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable() then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

      }),

      -- sources (order matters)
      sources = ({
        { name = "luasnip" }, -- snippets
        { name = "buffer" },  -- text within current buffer
        { name = "path" },    -- file system paths
      }),

      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },

      -- TODO: if copilot works with cmp, reenable this
      experimental = {
        ghost_text = false,
      },
    })

  end,
}
