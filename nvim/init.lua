---@diagnostic disable-next-line: duplicate-set-field
vim.pack.add_silent = function(specs, opts)
	opts = vim.F.if_nil(opts, {})
	opts.confirm = false
	vim.pack.add(specs, opts)
end

local g = vim.g
local o = vim.opt

-- stylua: ignore start

o.autocomplete            = true
o.clipboard               = 'unnamedplus'
o.completeopt             = 'menu,popup,preview,fuzzy,noinsert'
o.confirm                 = true
o.expandtab               = true
o.fillchars               = { eob = ' ' }
o.helpheight              = 30
o.hlsearch                = false
o.ignorecase              = true
o.inccommand              = 'split'
o.laststatus              = 3
o.number                  = true
o.relativenumber          = true
o.scrolloff               = 10
o.shiftwidth              = 2
o.showtabline             = 0
o.signcolumn              = 'yes'
o.smartcase               = true
o.spell                   = false
o.splitbelow              = true
o.splitright              = true
o.swapfile                = false
o.tabstop                 = 2
o.termguicolors           = true
o.undofile                = true
o.wrap                    = false
g.loaded_node_provider    = 0
g.loaded_perl_provider    = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider    = 0
g.mapleader               = ' '

-- stylua: ignore end

-- Keymaps

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

-- Autocommands

local ac = vim.api.nvim_create_autocmd
local ag = vim.api.nvim_create_augroup('custom-autocommands', { clear = true })

ac('TextYankPost', {
	group = ag,
	callback = function()
		vim.hl.on_yank()
	end,
})

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

-- Builtins

vim.cmd('packadd nvim.undotree')

require('vim._core.ui2').enable()

-- Oil.nvim (local)

vim.opt.runtimepath:append(vim.fn.expand('$HOME/Work/oil.nvim'))

require('oil').setup({
	skip_confirm_for_simple_edits = true,
	float = { border = 'single', max_height = 0.6, max_width = 0.6 },
	columns = { 'permissions', 'icon' },
	keymaps = {
		['q'] = { 'actions.close' },
	},
})

map('n', '<leader>e', '<Cmd>Oil %:p:h<Cr>', { desc = 'Open oil.nvim' })

-- Fyler.nvim (local)

vim.opt.runtimepath:append(vim.fn.expand('$HOME/Work/fyler.nvim'))

require('fyler').setup()

-- Mini.nvim

vim.pack.add_silent({ 'git@github.com:nvim-mini/mini.nvim' })

for _, module in ipairs({
	'mini.icons',
	'mini.pairs',
	'mini.extra',
	'mini.statusline',
}) do
	require(module).setup()
end

require('mini.base16').setup({
  -- stylua: ignore
  palette = {
    base00 = '#1e1e2e',
    base01 = '#1e1e2e',
    base02 = '#2a2a3e',
    base03 = '#5a5a7a',
    base04 = '#7a7a90',
    base05 = '#a0a0b0',
    base06 = '#bcbcca',
    base07 = '#d8d8e4',
    base08 = '#d97080',
    base09 = '#c49050',
    base0A = '#4aaa6a',
    base0B = '#4aaa6a',
    base0C = '#5aaecc',
    base0D = '#7aaae0',
    base0E = '#8a78b8',
    base0F = '#d97080',
  },
	use_cterm = true,
})

require('mini.pick').setup({
	window = {
		prompt_prefix = ' ',
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

	require('mini.pick').default_show(buf_id, items, query, opts)

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

	local ft = vim.bo[items[1].bufnr].filetype
	local has_lang, lang = pcall(vim.treesitter.language.get_lang, ft)
	local has_ts, _ = pcall(vim.treesitter.start, buf_id, has_lang and lang or ft)
	if not has_ts and ft then
		vim.bo[buf_id].syntax = ft
	end
end

require('mini.pick').registry.buffer_lines_current = function()
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
map('n', '<leader>sd', '<Cmd>Pick diagnostic<Cr>',                                                                             { desc = 'Mini.pick - Diagnostic' })
map('n', '<leader>ss', '<Cmd>Pick spellsuggest<Cr>',                                                                           { desc = 'Mini.pick - Spell Suggest' })
map('n', '<leader>sG', '<Cmd>Pick grep pattern="<cword>"<Cr>',                                                                 { desc = 'Mini.pick - Grep Live Word' })
map('n', '<leader>/',  '<Cmd>Pick buffer_lines_current scope="current"<Cr>',                                                   { desc = 'Mini.pick - Buffer Lines' })
map('n', '<leader>fc', '<Cmd>lua MiniPick.builtin.files({}, { source = { cwd = vim.fn.expand("$HOME/Work/dotfiles") } })<Cr>', { desc = 'Mini.pick - File (Config)' })

-- stylua: ignore end

-- LSP

vim.pack.add_silent({
	'git@github.com:mason-org/mason.nvim',
	'git@github.com:neovim/nvim-lspconfig',
	'git@github.com:mason-org/mason-lspconfig.nvim',
	'git@github.com:WhoIsSethDaniel/mason-tool-installer.nvim',
})

require('mason').setup({
	max_concurrent_installers = 10,
	ui = {
		backdrop = 100,
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

local function make_lsp_map(map_fn, event)
	return function(keys, func, desc, mode)
		map_fn(mode or 'n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc, nowait = true })
	end
end

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('neovim-lsp-attach', { clear = true }),
	callback = function(event)
		local map_lsp = make_lsp_map(map, event)

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
	virtual_text = { prefix = ' ' },
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
	},
	automatic_installation = true,
})

-- Conform

vim.pack.add_silent({ 'git@github.com:stevearc/conform.nvim' })

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

-- Treesitter

vim.pack.add_silent({ 'git@github.com:nvim-treesitter/nvim-treesitter' })

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

vim.api.nvim_create_autocmd('FileType', {
	desc = 'Start tree-sitter',
	pattern = filetypes,
	group = vim.api.nvim_create_augroup('neovim-treesitter', { clear = true }),
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})

-- Neogit

vim.pack.add_silent({
	'git@github.com:NeogitOrg/neogit',
	'git@github.com:nvim-lua/plenary.nvim',
	'git@github.com:sindrets/diffview.nvim',
	'git@github.com:nvim-tree/nvim-web-devicons',
})

require('neogit').setup({
	kind = 'tab',
	graph_style = 'kitty',
	disable_hint = true,
	remember_settings = false,
	highlight = { italic = false },
})

map('n', '<leader>gg', '<Cmd>Neogit<Cr>', { desc = 'Neogit - Status' })

-- Copilot

vim.pack.add_silent({ 'git@github.com:github/copilot.vim' })

-- Dadbod

vim.pack.add_silent({
	'git@github.com:tpope/vim-dadbod',
	'git@github.com:kristijanhusak/vim-dadbod-ui',
	'git@github.com:kristijanhusak/vim-dadbod-completion',
})
