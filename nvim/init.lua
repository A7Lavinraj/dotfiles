---@diagnostic disable-next-line: duplicate-set-field
vim.pack.add_with_confirm = function(specs, opts)
	opts = vim.F.if_nil(opts, {})
	opts.confirm = false

	vim.pack.add(specs, opts)
end

local g = vim.g
local o = vim.opt

-- stylua: ignore start

o.clipboard               = 'unnamedplus'                         -- Clipboard
o.completeopt             = 'menu,fuzzy,noinsert'                      -- Completion menu
o.confirm                 = true                                  -- Confirm instead of throwing error.
-- o.cmdheight               = 0
o.expandtab               = true
o.fillchars               = { eob = ' ' }                         -- Remove end of buffer tilde.
-- o.guicursor               = ''
o.helpheight              = 30
o.hlsearch                = false                                 -- Disable highlight search
o.ignorecase              = true
o.inccommand              = 'split'                               -- Split UI for search and replace
o.laststatus              = 3                                     -- Custom statusline
-- o.statusline              = string.rep('⎯', vim.o.columns)
o.number                  = true                                  -- Enable numbers
o.pumborder               = 'single'
o.relativenumber          = true                                  -- Enable relative numbers
o.scrolloff               = 10                                    -- Cursor margin from top-bottom
o.shiftwidth              = 2
o.showtabline             = 0                                     -- Disable tabline
o.signcolumn              = 'yes'                                 -- Enable signcolumn
o.smartcase               = true
o.splitbelow              = true
o.splitright              = true
o.swapfile                = false                                 -- No swap files
o.tabstop                 = 2
o.termguicolors           = true
o.undofile                = true                                  -- Enable undofiles
o.wrap                    = false                                 -- No wrap
g.loaded_node_provider    = 0
g.loaded_perl_provider    = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider    = 0
g.mapleader               = ' '
g.netrw_banner            = 0
g.netrw_liststyle         = 3
g.netrw_hide              = 1

-- stylua: ignore end

local map = vim.keymap.set

map('n', '<C-h>', '<C-w>h', { desc = 'Goto left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Goto down window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Goto up window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Goto right window' })
map('n', '<Tab>', '<Cmd>tabnext<Cr>', { desc = 'Goto next tab' })
map('n', '<S-Tab>', '<Cmd>tabprevious<Cr>', { desc = 'Goto previous tab' })
map(
	'n',
	'<leader>ud',
	'<Cmd>lua require("undotree").open({ command = "topleft 20new" })<Cr>',
	{ desc = 'Undotree open' }
)
map('n', '<leader>cm', function()
	vim.ui.input({
		completion = 'shellcmdline',
		prompt = 'Shell Command: ',
	}, function(input)
		if not input or #input == 0 then
			return
		end

		vim.cmd('botright new | terminal ' .. input)
		vim.cmd('set filetype=terminal')
	end)
end, { desc = 'Shell Command' })

-- stylua: ignore end

local ac = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup('custom-autocommands', { clear = true })

-- Highlight copied text
ac('TextYankPost', {
	group = ag,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Goto last visited line
ac('BufReadPost', {
	group = ag,
	callback = function(event)
		local exclude = { 'gitcommit' }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].is_last_loc then
			return
		end
		vim.b[buf].is_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Ref: https://www.lazyvim.org/configuration/general#auto-commands
ac('FileType', {
	group = ag,
	pattern = {
		'PlenaryTestPopup',
		'checkhealth',
		'dap-float',
		'dbout',
		'gitsigns-blame',
		'grug-far',
		'help',
		'lspinfo',
		'neotest-output',
		'neotest-output-panel',
		'neotest-summary',
		'notify',
		'nvim-undotree',
		'qf',
		'spectre_panel',
		'startuptime',
		'terminal',
		'tsplayground',
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set('n', 'q', function()
				vim.cmd('close')
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = 'Quit buffer',
			})
		end)
	end,
})

vim.cmd('packadd nvim.undotree')

require('vim._core.ui2').enable()

vim.opt.runtimepath:append(vim.fn.expand('$HOME/Work/oil.nvim'))
do
	require('oil').setup({
		skip_confirm_for_simple_edits = true,
		float = { border = 'rounded', max_height = 0.6, max_width = 0.6 },
		columns = { 'permissions', 'icon' },
		keymaps = {
			['q'] = { 'actions.close' },
		},
	})

	vim.keymap.set('n', '<leader>e', '<Cmd>Oil %:p:h<Cr>', { desc = 'Open oil.nvim' })
end

vim.opt.runtimepath:append(vim.fn.expand('$HOME/Work/fyler.nvim'))
do
	require('fyler').setup()
end

vim.pack.add_with_confirm({ 'git@github.com:folke/tokyonight.nvim' })
do
	require('tokyonight').setup({
		transparent = true,
		styles = {
			comments = { italic = false },
			keywords = { italic = false },
			sidebars = 'transparent',
			floats = 'transparent',
		},
	})

	vim.cmd('colorscheme tokyonight-night')
end

vim.pack.add_with_confirm({ 'git@github.com:nvim-mini/mini.nvim' })
do
	for _, module in ipairs({
		'mini.icons',
		'mini.pairs',
		'mini.extra',
		'mini.completion',
	}) do
		require(module).setup()
	end

	require('mini.pick').setup({
		window = {
			prompt_prefix = ' ',
			config = function()
				local height = math.floor(0.300 * vim.o.lines) + 2
				local width = math.floor(1.000 * vim.o.columns)
				return {
					anchor = 'NW',
					height = height,
					width = width,
					row = math.floor(1.0 * (vim.o.lines - height)),
					col = math.floor(0.5 * (vim.o.columns - width)),
					border = { ' ', '─', ' ', ' ', ' ', ' ', ' ', ' ' },
				}
			end,
		},
	})

	-- Ref: https://github.com/nvim-mini/mini.nvim/discussions/988#discussioncomment-10398788
	local ns_digit_prefix = vim.api.nvim_create_namespace('cur-buf-pick-show')
	local show_cur_buf_lines = function(buf_id, items, query, opts)
		if items == nil or #items == 0 then
			return
		end

		-- Show as usual
		require('mini.pick').default_show(buf_id, items, query, opts)

		-- Move prefix line numbers into inline extmarks
		local lines = vim.api.nvim_buf_get_lines(buf_id, 0, -1, false)
		local digit_prefixes = {}
		for i, l in ipairs(lines) do
			local _, prefix_end, prefix = l:find('^(%s*%d+│)')
			if prefix_end ~= nil then
				digit_prefixes[i], lines[i] = prefix, l:sub(prefix_end + 1)
			end
		end

		vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
		for i, pref in pairs(digit_prefixes) do
			vim.api.nvim_buf_set_extmark(
				buf_id,
				ns_digit_prefix,
				i - 1,
				0,
				{ virt_text = { { pref, 'MiniPickNormal' } }, virt_text_pos = 'inline' }
			)
		end

		-- Set highlighting based on the curent filetype
		local ft = vim.bo[items[1].bufnr].filetype
		local has_lang, lang = pcall(vim.treesitter.language.get_lang, ft)
		local has_ts, _ = pcall(vim.treesitter.start, buf_id, has_lang and lang or ft)
		if not has_ts and ft then
			vim.bo[buf_id].syntax = ft
		end
	end

	require('mini.pick').registry.buffer_lines_current = function()
		-- local local_opts = { scope = "current", preserve_order = true } -- use preserve_order
		local local_opts = { scope = 'current' }
		require('mini.extra').pickers.buf_lines(local_opts, { source = { show = show_cur_buf_lines } })
	end

  -- stylua: ignore start

  map('n', 'H',          '<Cmd>Pick buffers<Cr>',                                                                                { desc = 'Mini.pick - Buffers' })
  map('n', '<leader>sh', '<Cmd>Pick help<Cr>',                                                                                   { desc = 'Mini.pick - Help' })
  map('n', '<leader>ff', '<Cmd>Pick files<Cr>',                                                                                  { desc = 'Mini.pick - Files' })
  map('n', '<leader>sk', '<Cmd>Pick keymaps<Cr>',                                                                                { desc = 'Mini.pick - Keymaps' })
  map('n', '<leader>sg', '<Cmd>Pick grep_live<Cr>',                                                                              { desc = 'Mini.pick - Grep Live' })
  map('n', '<leader>fg', '<Cmd>Pick git_files<Cr>',                                                                              { desc = 'Mini.pick - Git Files' })
  map('n', '<leader>sH', '<Cmd>Pick hl_groups<Cr>',                                                                              { desc = 'Mini.pick - Highlights' })
  map('n', '<leader>sd', '<Cmd>Pick diagnostic<Cr>',                                                                             { desc = 'Mini.pick - Spell Suggest' })
  map('n', '<leader>ss', '<Cmd>Pick spellsuggest<Cr>',                                                                           { desc = 'Mini.pick - Spell Suggest' })
  map('n', '<leader>sG', '<Cmd>Pick grep pattern="<cword>"<Cr>',                                                                 { desc = 'Mini.pick - Grep Live Word' })
  map('n', '<leader>/',  '<Cmd>Pick buffer_lines_current scope="current"<Cr>',                                                   { desc = 'Mini.pick - Buffer Lines' })
  map('n', '<leader>fc', '<Cmd>lua MiniPick.builtin.files({}, { source = { cwd = vim.fn.expand("$HOME/Work/dotfiles") } })<Cr>', { desc = 'Mini.pick - File (Config)' })

	-- stylua: ignore end
end

vim.pack.add_with_confirm({
	'git@github.com:mason-org/mason.nvim',
	'git@github.com:neovim/nvim-lspconfig',
	'git@github.com:mason-org/mason-lspconfig.nvim',
	'git@github.com:WhoIsSethDaniel/mason-tool-installer.nvim',
})
do
	require('mason').setup({
		max_concurrent_installers = 10,
		ui = {
			height = 0.5,
			backdrop = 100,
			border = 'single',
			icons = {
				package_pending = '',
				package_installed = '',
				package_uninstalled = '',
			},
		},
	})

	require('mason-tool-installer').setup({
		ensure_installed = { 'stylua', 'prettierd', 'eslint_d', 'ocamlformat' },
	})

	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('neovim-lsp-attach', { clear = true }),
		callback = function(event)
			local map_lsp = function(keys, func, desc, mode)
				mode = mode or 'n'
				map(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc, nowait = true })
			end

			local is_loaded, mini_extra = pcall(require, 'mini.extra')
			if is_loaded then
				map_lsp('<leader>cr', vim.lsp.buf.rename, 'Rename')
				map_lsp('gd', function()
					mini_extra.pickers.lsp({ scope = 'definition' })
				end, 'Goto Definition')
				map_lsp('gr', function()
					mini_extra.pickers.lsp({ scope = 'references' })
				end, 'Goto References')
				map_lsp('<leader>fs', function()
					mini_extra.pickers.lsp({ scope = 'document_symbol' })
				end, 'Workspace symbols')
				map_lsp('<leader>cd', function()
					vim.diagnostic.open_float({ border = 'single' })
				end, 'Show Diagnostic')
				map_lsp('K', function()
					vim.lsp.buf.hover({ border = 'single' })
				end, 'Hover Documentation')
				map_lsp('[d', function()
					vim.diagnostic.jump({ count = -1, on_jump = vim.diagnostic.open_float })
				end, 'Previous Diagnostic')
				map_lsp(']d', function()
					vim.diagnostic.jump({ count = 1, on_jump = vim.diagnostic.open_float })
				end, 'Next Diagnostic')
				map_lsp('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
			end
		end,
	})

	vim.diagnostic.config({
		virtual_text = { prefix = ' ' },
		signs = false,
		underline = false,
		update_in_insert = false,
		severity_sort = true,
		float = { border = 'single' },
	})

	require('mason-lspconfig').setup({
		ensure_installed = {
			'cssls',
			'html',
			'intelephense',
			'lua_ls',
			'marksman',
			'svelte',
			'tailwindcss',
			'ts_ls',
			'yamlls',
			'zls',
			'rust_analyzer',
			'emmet_language_server',
			'ocamllsp',
			-- "glslls",
		},
		automatic_installation = true,
	})
end

vim.pack.add_with_confirm({ 'git@github.com:stevearc/conform.nvim' })
do
	require('conform').setup({
		formatters_by_ft = {
			lua = { 'stylua' },
			json = { 'prettierd' },
			markdown = { 'prettierd' },
			javascript = { 'prettierd' },
			typescript = { 'prettierd' },
			javascriptreact = { 'prettierd' },
			typescriptreact = { 'prettierd' },
		},
		format_after_save = {
			lsp_format = 'fallback',
		},
	})
end

vim.pack.add_with_confirm({ 'git@github.com:nvim-treesitter/nvim-treesitter' })
do
	local languages = {
		'lua',
		'vimdoc',
		'markdown',
		'svelte',
		'javascript',
		'typescript',
		'html',
		'css',
		'php',
	}
	local isnt_installed = function(lang)
		return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
	end
	local to_install = vim.tbl_filter(isnt_installed, languages)
	if #to_install > 0 then
		require('nvim-treesitter').install(to_install)
	end

	local filetypes = {}
	for _, lang in ipairs(languages) do
		for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
			table.insert(filetypes, ft)
		end
	end
	local ts_start = function(ev)
		vim.treesitter.start(ev.buf)
	end
	vim.api.nvim_create_autocmd('FileType', {
		desc = 'Start tree-sitter',
		pattern = filetypes,
		group = vim.api.nvim_create_augroup('neovim-treesitter', { clear = true }),
		callback = ts_start,
	})
end

-- stylua: ignore start

vim.pack.add_with_confirm({
  'git@github.com:NeogitOrg/neogit',
  'git@github.com:nvim-lua/plenary.nvim',
  'git@github.com:sindrets/diffview.nvim',
  'git@github.com:nvim-tree/nvim-web-devicons'
})
do
  require("neogit").setup({
    kind = "tab",
    graph_style = "kitty",
    disable_hint = true,
    remember_settings = false,
  })

	map("n", "<leader>gg", "<Cmd>Neogit<Cr>", { desc = "Neogit - Status" })
end

-- stylua: ignore end

vim.pack.add_with_confirm({ 'git@github.com:github/copilot.vim' })

vim.pack.add_with_confirm({
	'git@github.com:tpope/vim-dadbod',
	'git@github.com:kristijanhusak/vim-dadbod-ui',
	'git@github.com:tpope/vim-dadbod',
	'git@github.com:kristijanhusak/vim-dadbod-completion',
})
do
	vim.g.db_ui_use_nerd_fonts = 1
end
