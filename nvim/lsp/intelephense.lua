---@type vim.lsp.Config
return {
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	root_markers = { ".git", "composer.json" },
	settings = {
		intelephense = {
			stubs = {
				"bcmath",
				"bz2",
				"calendar",
				"Core",
				"curl",
				"zip",
				"zlib",
				"wordpress",
				"woocommerce",
				"acf-pro",
				"wordpress-globals",
				"wp-cli",
				"genesis",
				"polylang",
			},
			environment = {
				includePaths = "/home/moko/.config/composer/vendor/php-stubs",
			},
			files = {
				maxSize = 5000000,
			},
		},
	},
}
