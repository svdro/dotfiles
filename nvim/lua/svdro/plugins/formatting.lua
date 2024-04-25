return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				-- prettier
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },

				-- lua
				lua = { "stylua" },

				-- python
				-- sequentially: isort for sorting imports, and black for everything else
				python = { "isort", "black" },

				-- go
				-- sequentially: fix long lines, then gofumpt (gofumpt is stricter than gofmt)
				go = { "golines", "gofumpt" },
			},
			format_on_save = { lsp_fallback = true, async = false, timeout_ms = 1000 },
		})

		-- set keymaps
		local keymap = vim.keymap

		keymap.set({ "n", "v" }, "<leader>FF", function()
			conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
		end, { noremap = true, silent = true, desc = "Format file (or range in visual mode)" })
	end,
}
