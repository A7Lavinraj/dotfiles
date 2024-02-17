local status, icons = pcall(require, "base.icons")
if not status then
	return
end

local watermark = function()
	return "NeoCode"
end

-- statusline
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { watermark },
			lualine_b = {
				{
					"branch",
					icons_enabled = true,
					icon = "󰘬",
				},
				{
					"diff",
					symbols = icons.git,
				},
			},
			lualine_c = {
				{
					"diagnostics",
					sections = { "error", "warn", "info", "hint" },
					diagnostics_color = {
						error = "DiagnosticError",
						warn = "DiagnosticWarn",
						info = "DiagnosticInfo",
						hint = "DiagnosticHint",
					},
					symbols = icons.diagnostics,
					colored = true,
					update_in_insert = false,
				},
			},
			lualine_x = {
				"filetype",
			},
		},
	},
}
