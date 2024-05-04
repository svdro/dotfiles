local function set_lualine_theme(name)
  -- Attempt to require the 'lualine' module
  local ok, lualine = pcall(require, "lualine")
  if not ok then
    print("Failed to require 'lualine'")
    return
  end

  -- 'auto' does not need to require anything
  -- this essentially does:
  -- lualine.options = { theme = name }
  if name == "auto" then
    lualine.setup({ options = { theme = name } })
    return
  end

  -- Attempt to load the theme module based on the provided name
  local theme_ok, theme = pcall(require, name)
  if not theme_ok then
    print("Failed to load theme:", name)
    return
  end

  -- Setup lualine with the loaded theme
  lualine.setup({ options = { theme = theme } })
end

local function switch_lualine_theme()
  local current_theme = vim.g.colors_name

  -- handle `gruvbox`
  if current_theme == "gruvbox" then
    set_lualine_theme("lualine.themes.gruvbox-material")

    -- handle other
  else
    --print("there's no preset lualine theme for ", current_theme, ", setting to auto")
    set_lualine_theme("auto")
  end
end

-- automatically switch lualine themes when colorthemes are changed.
-- this will automatically set the lualine theme when the colortheme is first
-- set in lua/svdro/options.lua.
vim.api.nvim_create_autocmd("colorscheme", {
  pattern = "*",
  callback = switch_lualine_theme,
})

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_x = {
          { "encoding" },
          { "filetype" },
        },
      },
    })
  end,
}
