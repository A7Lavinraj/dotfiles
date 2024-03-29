-- colorscheme (catppuccin with nvchad flavour).
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
			local overrides = require("base.themes.catppuccin").highlight
			for key, value in pairs(overrides) do
				vim.api.nvim_set_hl(0, key, value)
			end
		end,
	},
}
