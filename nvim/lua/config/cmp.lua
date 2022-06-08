local ok, cmp = pcall(require, "cmp")
if not ok then
  return
end

local ok, luasnip = pcall(require, "luasnip")
if not ok then
  return
end

-- required to make snippets work
require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." -1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

--local kind_icons = {
  --Class = '∴',
  --Color = '🖌',
  --Constant = '𝜋',
  --Constructor = '⬡',
  --Enum = '',
  --EnumMember = '',
  --Event = '',
  --Field = '🠶',
  --File = '',
  --Folder = '',
  --Function = 'ƒ',
  --Interface = '',
  --Keyword = '🗝',
  --Method = '𝘮',
  --Module = '📦',
  --Operator = '≠',
  --Property = '∷',
  --Reference = '⊷',
  --Snippet = '{}',
  --Struct = '',
  --Text = '#',
  --TypeParameter = '×',
  --Unit = '()',
  --Variable = '𝓧',
--}

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  window = {
    --documentation = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, },
    --completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, },
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = {
     ["<C-j>"] = cmp.mapping.select_next_item(),
     ["<C-k>"] = cmp.mapping.select_prev_item(),
     ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
     ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
     ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
     ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close(), },
     ["<CR>"] = cmp.mapping.confirm { select = true },
     ["<Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then cmp.select_next_item()
       elseif luasnip.expandable() then luasnip.expand()
       elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
       elseif check_backspace() then fallback()
       else fallback()
       end
     end, {"i", "s"}),
     ["<S-Tab>"] = cmp.mapping(function(fallback)
       if cmp.visible() then cmp.select_prev_item()
       elseif luasnip.jumpable() then luasnip.jump(-1)
       else fallback()
       end
     end, {"i", "s"}),
  },

  formatting = {
    fields={ "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      vim_item.menu = ( {
        --nvim_lsp = "[LSP]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end
  },

  sources = {
    { name = "luasnip" },
    { name = "buffer", keyword_length = 2 },
    { name = "path" },
  },

  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },

  experimental = {
    ghost_text = true,
  },
}
