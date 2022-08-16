local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	return
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

local function lsp_highlight_document(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
      augroup LSP_DOCUMENT_HIGHLIGHT
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
			false
		)
	end
end

local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false --let null-ls take care of formatting
	lsp_highlight_document(client)

	--if client.name == "tsserver" then
	--client.resolved_capabilities.document_formatting = false
	--end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local servers = { "pyright", "gopls", "tsserver", "sumneko_lua", "rust_analyzer", "taplo" }
for _, server in pairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	local has_custom_opts, server_custom_opts = pcall(require, "config.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", server_custom_opts, opts)
	end
	lspconfig[server].setup(opts)
end
