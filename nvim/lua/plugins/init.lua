return {
	-- colorscheme.
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa").setup({
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
								whitespace = "#2A2A37",
							},
						},
					},
				},
			})
		end,
	},

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("plugins.configs.lualine"),
	},

	{ "CRAG666/code_runner.nvim", config = true },

	-- autotag for html, jsx and more.
	{ "windwp/nvim-ts-autotag", opts = { enable = true, enable_rename = true } },

	-- interactive git support.
	{ "tpope/vim-fugitive" },

	-- nvim-end tmux support.
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },

	-- comment functionality.
	{ "tpope/vim-commentary", event = "VeryLazy" },

	-- autopair for brackets.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
			},
		},
	},

	-- interactive file explorer in lua.
	{
		"nvim-tree/nvim-tree.lua",
		opts = require("plugins.configs.nvimtree"),
	},

	-- tabline support
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = require("plugins.configs.bufferline"),
	},

	-- for enable the indent markers.
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = { enabled = false },
		},
	},

	-- terminal integration.
	{
		"NvChad/nvterm",
		opts = {
			terminals = {
				type_opts = {
					vertical = { location = "rightbelow", split_ratio = 0.4 },
				},
			},
			behavior = {
				autoclose_on_quit = {
					enabled = false,
					confirm = true,
				},
				close_on_exit = true,
				auto_insert = true,
			},
		},
	},

	-- fuzzy file finder.
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require("plugins.configs.telescope")
		end,
	},

	-- auto completion engine.
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = require("plugins.configs.cmp"),
	},

	-- snippet engine.
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = require("plugins.configs.luasnip-engine"),
	},

	-- lsp support.
	{

		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			{ "williamboman/mason-lspconfig.nvim", opts = require("plugins.configs.mason-lspconfig-options") },
		},
		config = require("plugins.configs.lsp"),
	},

	-- syntax highlighting.
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = {
					enable = true,
				},
				-- ensure these language parsers are installed
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
				},
			})
		end,
	},

	-- auto formatting.
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("plugins.configs.none-ls")
		end,
	},

	-- vim transparent
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").clear_prefix("NvimTree")
			require("transparent").clear_prefix("Bufferline")
		end,
	},
}
