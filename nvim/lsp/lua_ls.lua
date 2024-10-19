---@type vim.lsp.Config
return {
	on_attach = function(client, bufnr)
		client.server_capabilities.semanticTokensProvider = nil
		client.server_capabilities.completionProvider.triggerCharacters = { '.', ':', '#', '(' }

		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
		end
	end,
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
			workspace = {
				ignoreSubmodules = true,
				library = { vim.env.VIMRUNTIME },
			},
		},
	},
}
