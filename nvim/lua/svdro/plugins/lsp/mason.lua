return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason") -- manage external editor tooling like **LSP Servers**
    local mason_lspconfig = require("mason-lspconfig") -- closes gaps between **mason.nvim** and **lspconfig**
    local mason_tool_installer = require("mason-tool-installer") -- extends **mason.nvim** to install third-party tools (e.g. formatters)

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
        "gopls",
        "html",
        "lua_ls",
        "pyright",
        "tsserver",
      },
    })

    -- setup mason-tool-installer with list of formatters to install
    mason_tool_installer.setup({
      ensure_installed = {
        "black",
        "isort",
        "golines",
        "gofumpt",
        "prettier",
        "stylua",
      },
    })
  end,
}
