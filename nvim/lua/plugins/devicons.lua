local status, overrides = pcall(require, "base.overrides")
if not status then
	return
end

return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			override = overrides.icons,
		})
	end,
}
