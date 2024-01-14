local function setup()
	local lspconfig = require("lspconfig")

	vim.diagnostic.config({
		float = { border = "rounded" },
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		update_in_insert = true,
	})

	local function lsp_keymaps(_, bufnr)
		local opts = { noremap = true, silent = true }
		local keymap = vim.api.nvim_buf_set_keymap
		keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
		keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
		keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
		keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
		keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
		keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
		keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	end

	-- used to enable autocompletion (assign to every lsp server config)
	local capabilities = require("cmp_nvim_lsp").default_capabilities()

	-- Change the Diagnostic symbols in the sign column (gutter)
	-- (not in youtube nvim video)
	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- configure lua server (with special settings)
	lspconfig["lua_ls"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- setup clangd server
	lspconfig["clangd"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
		cmd = { "clangd", "-header-insertion=never" },
	})

	-- configure html server
	lspconfig["html"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})

	-- configure typescript server with plugin
	lspconfig["tsserver"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})

	-- configure css server
	lspconfig["cssls"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})

	-- configure tailwindcss server
	lspconfig["tailwindcss"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})

	-- configure prisma orm server
	lspconfig["prismals"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})

	-- configure emmet language server
	lspconfig["emmet_ls"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
		filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
	})

	-- configure svelte server
	lspconfig["svelte"].setup({
		capabilities = capabilities,
		on_attach = function(client, _)
			lsp_keymaps()
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = { "*.js", "*.ts" },
				callback = function(ctx)
					if client.name == "svelte" then
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
					end
				end,
			})
		end,
	})

	-- configure python server
	lspconfig["pyright"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})

	-- configure bash server
	lspconfig["bashls"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})

	-- configure eslint server
	lspconfig["eslint"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})

	-- configure rust server
	lspconfig["rust_analyzer"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})

	-- configure java server
	lspconfig["jdtls"].setup({
		on_attach = lsp_keymaps,
		capabilities = capabilities,
	})
end

return setup
