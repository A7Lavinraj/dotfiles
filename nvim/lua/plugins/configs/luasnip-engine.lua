local function setup()
	require("luasnip.loaders.from_snipmate").lazy_load({ paths = "~/.config/nvim/snippets" })
	require("luasnip/loaders/from_vscode").lazy_load()
	require("luasnip").setup({
		updateevents = "TextChanged, TextChangedI",
	})
end

return setup
