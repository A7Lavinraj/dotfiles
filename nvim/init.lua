vim.g.mapleader = " "
vim.g.maplocalleader = " "

local path = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy/lazy.nvim")
if not vim.uv.fs_stat(path) then
	vim.cmd('echo "Installing `lazy.nvim`" | redraw')
	local clone_cmd = { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", path }
	vim.fn.system(clone_cmd)
	vim.cmd('echo "Installed `lazy.nvim`" | redraw')
end

vim.opt.runtimepath:prepend(path)

require("lazy").setup({
	checker = { enabled = true, notify = false },
	install = { colorscheme = { "tokyonight", "habamax" } },
	spec = {
		{
			dir = vim.fs.joinpath(vim.fn.expand("$HOME"), "Work/fyler.nvim"),
			dependencies = {
				"nvim-mini/mini.icons",
				"nvim-tree/nvim-web-devicons",
				"lambdalisue/vim-nerdfont",
			},
			lazy = false,
			opts = {
				integrations = { icon = "vim_nerdfont" },
				views = {
					finder = {
						confirm_simple = true,
						default_explorer = true,
						git_status = { enabled = false },
						icon = { directory_empty = "", directory_expanded = "", directory_collapsed = "" },
					},
				},
			},
      -- stylua: ignore start
      keys = {
        { "<leader>e", function() require("fyler").open() end, { desc = "Fyler.nvim" } }
      },
			-- stylua: ignore end
		},
		{
			"folke/tokyonight.nvim",
			priority = 10000,
			lazy = false,
			opts = {
				transparent = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "transparent",
					floats = "transparent",
				},
			},
			config = function(_, opts)
				require("tokyonight").setup(opts)

				vim.cmd.colorscheme("tokyonight-night")
			end,
		},
		{
			{ "nvim-mini/mini.pairs", opts = {} },
		},
		{
			"folke/snacks.nvim",
			opts = {
				picker = {
					ui_select = true,
					layout = "ivy",
					layouts = {
						ivy = {
							layout = {
								backdrop = false,
								border = "top",
								box = "vertical",
								height = 0.5,
								row = -1,
								{ win = "input", height = 1 },
								{
									box = "horizontal",
									{ win = "list", border = "none" },
									{ win = "preview" },
								},
							},
						},
					},
				},
			},
			keys = {
        -- stylua: ignore start
        { "<leader>fb", function() require("snacks").picker.buffers() end, { desc = "Find Buffers" } },
        { "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config" } },
        { "<leader>fd", function() require("snacks").picker.files({ cwd = vim.fn.expand("$XDG_CONFIG_HOME") }) end, { desc = "Find Dotfiles" } },
        { "<leader>ff", function() require("snacks").picker.files() end, { desc = "Find Files" } },
        { "<leader><leader>", function() require("snacks").picker.git_files() end, { desc = "Find Git Files" } },
        { "<leader>fs", function() require("snacks").picker.files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") }) end, { desc = "Find Source" } },
        { "<leader>fz", function() require("snacks").picker.lines() end, { desc = "Current Buffer lines" } },
        { "<leader>sg", function() require("snacks").picker.grep() end, { desc = "Search grep" } },
        { "<leader>sh", function() require("snacks").picker.help() end, { desc = "Search help" } },
        { "<leader>sH", function() require("snacks").picker.highlights() end, { desc = "Search Highlights" } },
        { "<leader>sw", function() require("snacks").picker.grep_word() end, { desc = "Search grep word" } },

        { "<leader>gg", function() require("snacks").lazygit() end, { desc = "Lazygit" } },
				-- stylua: ignore end
			},
		},
		{
			"mason-org/mason-lspconfig.nvim",
			dependencies = {
				{ "neovim/nvim-lspconfig" },
				{ "folke/snacks.nvim" },
				{ "mason-org/mason.nvim", opts = {} },
				{
					"WhoIsSethDaniel/mason-tool-installer.nvim",
					opts = {
						ensure_installed = {
							-- Linters, Formaters, etc
							"stylua",

							-- LSP
							"cssls",
							"html",
							-- "lua_ls",
							"svelte",
							"tailwindcss",
							"ts_ls",
							"yamlls",
						},
					},
				},
			},
			opts = {},
		},
		{
			"saghen/blink.cmp",
			version = "1.*",
			opts = { keymap = { preset = "enter" } },
		},
		{
			"stevearc/conform.nvim",
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 500,
				},
			},
		},
	},
})
