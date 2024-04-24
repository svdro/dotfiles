return {
  "williamboman/mason.nvim",
  dependencies = { 
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and setup icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- setup mason-lspconfig with list of language servers to install
    -- NOTE: when changing this update list of servers in README.md
    mason_lspconfig.setup({
      ensure_installed = {
        "cssls",
        "dockerls",
        "docker_compose_language_service",
        --"gopls",
        "html",
        "lua_ls",
        "pyright",
        "tsserver",
      },
    })
  end,
}
