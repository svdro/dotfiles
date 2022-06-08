--[[
NOTE: for some reason highlight needs to be enabled before doing the pcall.

commands:
  :TSInstall <language to install>
  :TSInstallInfo
  :TSEnable highlight
  :TSDisable highlight
--]]

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true, -- `false` will disable the whole extension
    disable = { }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
    indent = { enable = true, disable = { "yaml" } },
  },
}

local status_ok, configs = pcall(require, "nvim-treesetter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = { "python" }, -- A list of parser names, or "all"
  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing (for "all")
}
