-- global project find and replace
return {
	{
		"nvim-pack/nvim-spectre",
		lazy = true,
		cmd = { "Spectre" },
		dependencies = {
			"nvim-lua/plenary.nvim",
			"catppuccin/nvim",
		},
		config = function()
			local theme = require("base.colors")

			vim.api.nvim_set_hl(0, "SpectreSearch", { bg = theme.base_30.red, fg = theme.base_30.grey_fg })
			vim.api.nvim_set_hl(0, "SpectreReplace", { bg = theme.base_30.green, fg = theme.base_30.grey_fg })

			require("spectre").setup({
				highlight = {
					search = "SpectreSearch",
					replace = "SpectreReplace",
				},
				mapping = {
					["send_to_qf"] = {
						map = "<C-q>",
						cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
						desc = "send all items to quickfix",
					},
				},
			})
		end,
	},
}
