local function folder()
	return vim.fn.expand("%:h:t")
end

return {
	"nvim-lualine/lualine.nvim",
	opts = {
		theme = "catppuccin",
		options = {
			component_separators = " ",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { folder },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
