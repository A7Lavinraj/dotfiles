-- Nvchad catppuccin color palatte
local base_16 = {
	base00 = "#1E1D2D",
	base01 = "#282737",
	base02 = "#2f2e3e",
	base03 = "#383747",
	base04 = "#414050",
	base05 = "#bfc6d4",
	base06 = "#ccd3e1",
	base07 = "#D9E0EE",
	base08 = "#F38BA8",
	base09 = "#F8BD96",
	base0A = "#FAE3B0",
	base0B = "#ABE9B3",
	base0C = "#89DCEB",
	base0D = "#89B4FA",
	base0E = "#CBA6F7",
	base0F = "#F38BA8",
}

local base_30 = {
	white = "#D9E0EE",
	darker_black = "#191828",
	black = "#1E1D2D", --  nvim bg
	black2 = "#252434",
	one_bg = "#2d2c3c", -- real bg of onedark
	one_bg2 = "#363545",
	one_bg3 = "#3e3d4d",
	grey = "#474656",
	grey_fg = "#4e4d5d",
	grey_fg2 = "#555464",
	light_grey = "#605f6f",
	red = "#F38BA8",
	baby_pink = "#ffa5c3",
	pink = "#F5C2E7",
	line = "#383747", -- for lines like vertsplit
	green = "#ABE9B3",
	vibrant_green = "#b6f4be",
	nord_blue = "#8bc2f0",
	blue = "#89B4FA",
	yellow = "#FAE3B0",
	sun = "#ffe9b6",
	purple = "#d0a9e5",
	dark_purple = "#c7a0dc",
	teal = "#B5E8E0",
	orange = "#F8BD96",
	cyan = "#89DCEB",
	statusline_bg = "#232232",
	lightbg = "#2f2e3e",
	pmenu_bg = "#ABE9B3",
	folder_bg = "#89B4FA",
	lavender = "#c7d1ff",
}

return {
	highlight = {
		Boolean = {
			fg = base_16.base09,
		},

		Character = {
			fg = base_16.base08,
		},

		Conditional = {
			fg = base_16.base0E,
		},

		Constant = {
			fg = base_16.base08,
		},

		Define = {
			fg = base_16.base0E,
			sp = "none",
		},

		Delimiter = {
			fg = base_16.base0F,
		},

		Float = {
			fg = base_16.base09,
		},

		Variable = {
			fg = base_16.base05,
		},

		Function = {
			fg = base_16.base0D,
		},

		Identifier = {
			fg = base_16.base08,
			sp = "none",
		},

		Include = {
			fg = base_16.base0D,
		},

		Keyword = {
			fg = base_16.base0E,
		},

		Label = {
			fg = base_16.base0A,
		},

		Number = {
			fg = base_16.base09,
		},

		Operator = {
			fg = base_16.base05,
			sp = "none",
		},

		PreProc = {
			fg = base_16.base0A,
		},

		Repeat = {
			fg = base_16.base0A,
		},

		Special = {
			fg = base_16.base0C,
		},

		SpecialChar = {
			fg = base_16.base0F,
		},

		Statement = {
			fg = base_16.base08,
		},

		StorageClass = {
			fg = base_16.base0A,
		},

		String = {
			fg = base_16.base0B,
		},

		Structure = {
			fg = base_16.base0E,
		},

		Tag = {
			fg = base_16.base0A,
		},

		Todo = {
			fg = base_16.base0A,
			bg = base_16.base01,
		},

		Type = {
			fg = base_16.base0A,
			sp = "none",
		},

		Typedef = {
			fg = base_16.base0A,
		},

		["NormalFloat"] = {
			bg = "none",
		},

		["FloatBorder"] = {
			bg = "none",
			fg = base_16.base04,
		},

		["@annotation"] = {
			fg = base_16.base0F,
		},

		["@attribute"] = {
			fg = base_16.base0A,
		},

		["@character"] = {
			fg = base_16.base08,
		},

		["@constructor"] = {
			fg = base_16.base0C,
		},

		["@constant"] = {
			fg = base_16.base08,
		},

		["@constant.builtin"] = {
			fg = base_16.base09,
		},

		["@constant.macro"] = {
			fg = base_16.base08,
		},

		["@error"] = {
			fg = base_16.base08,
		},

		["@exception"] = {
			fg = base_16.base08,
		},

		["@float"] = {
			fg = base_16.base09,
		},

		["@keyword"] = {
			fg = base_16.base0E,
		},

		["@keyword.function"] = {
			fg = base_16.base0E,
		},

		["@keyword.return"] = {
			fg = base_16.base0E,
		},

		["@function"] = {
			fg = base_16.base0D,
		},

		["@function.builtin"] = {
			fg = base_16.base0D,
		},

		["@function.macro"] = {
			fg = base_16.base08,
		},

		["@function.call"] = {
			fg = base_16.base0D,
		},

		["@operator"] = {
			fg = base_16.base05,
		},

		["@keyword.operator"] = {
			fg = base_16.base0E,
		},

		["@method"] = {
			fg = base_16.base0D,
		},

		["@method.call"] = {
			fg = base_16.base0D,
		},

		["@namespace"] = {
			fg = base_16.base08,
		},

		["@none"] = {
			fg = base_16.base05,
		},

		["@parameter"] = {
			fg = base_16.base08,
		},

		["@reference"] = {
			fg = base_16.base05,
		},

		["@punctuation.bracket"] = {
			fg = base_16.base0F,
		},

		["@punctuation.delimiter"] = {
			fg = base_16.base0F,
		},

		["@punctuation.special"] = {
			fg = base_16.base08,
		},

		["@string"] = {
			fg = base_16.base0B,
		},

		["@string.regex"] = {
			fg = base_16.base0C,
		},

		["@string.escape"] = {
			fg = base_16.base0C,
		},

		["@string.special"] = {
			fg = base_16.base0C,
		},

		["@symbol"] = {
			fg = base_16.base0B,
		},

		["@tag"] = {
			fg = base_16.base0A,
		},

		["@tag.attribute"] = {
			fg = base_16.base08,
		},

		["@tag.delimiter"] = {
			fg = base_16.base0F,
		},

		["@text"] = {
			fg = base_16.base05,
		},

		["@text.strong"] = {
			bold = true,
		},

		["@text.emphasis"] = {
			fg = base_16.base09,
		},

		["@text.strike"] = {
			fg = base_16.base0F,
			strikethrough = true,
		},

		["@text.literal"] = {
			fg = base_16.base09,
		},

		["@text.uri"] = {
			fg = base_16.base09,
			underline = true,
		},

		["@type.builtin"] = {
			fg = base_16.base0A,
		},

		["@variable"] = {
			fg = base_16.base05,
		},

		["@variable.builtin"] = {
			fg = base_16.base09,
		},

		-- variable.global

		["@definition"] = {
			sp = base_16.base04,
			underline = true,
		},

		TSDefinitionUsage = {
			sp = base_16.base04,
			underline = true,
		},

		["@scope"] = {
			bold = true,
		},

		["@field"] = {
			fg = base_16.base08,
		},

		["@field.key"] = {
			fg = base_16.base08,
		},

		["@property"] = {
			fg = base_16.base08,
		},

		["@include"] = {
			fg = base_16.base0D,
		},

		["@conditional"] = {
			fg = base_16.base0E,
		},
	},
	icons = {
		default_icon = {
			icon = "󰈚",
			name = "Default",
			color = base_30.red,
		},

		c = {
			icon = "",
			name = "c",
			color = base_30.blue,
		},

		cpp = {
			icon = "",
			name = "cpp",
			color = base_30.blue,
		},

		css = {
			icon = "",
			name = "css",
			color = base_30.blue,
		},

		dart = {
			icon = "",
			name = "dart",
			color = base_30.cyan,
		},

		deb = {
			icon = "",
			name = "deb",
			color = base_30.cyan,
		},

		Dockerfile = {
			icon = "",
			name = "Dockerfile",
			color = base_30.cyan,
		},

		html = {
			icon = "",
			name = "html",
			color = base_30.baby_pink,
		},

		jpeg = {
			icon = "󰉏",
			name = "jpeg",
			color = base_30.dark_purple,
		},

		jpg = {
			icon = "󰉏",
			name = "jpg",
			color = base_30.dark_purple,
		},

		js = {
			icon = "󰌞",
			name = "js",
			color = base_30.sun,
		},

		kt = {
			icon = "󱈙",
			name = "kt",
			color = base_30.orange,
		},

		lock = {
			icon = "󰌾",
			name = "lock",
			color = base_30.red,
		},

		lua = {
			icon = "",
			name = "lua",
			color = base_30.blue,
		},

		mp3 = {
			icon = "󰎆",
			name = "mp3",
			color = base_30.white,
		},

		mp4 = {
			icon = "",
			name = "mp4",
			color = base_30.white,
		},

		out = {
			icon = "",
			name = "out",
			color = base_30.white,
		},

		png = {
			icon = "󰉏",
			name = "png",
			color = base_30.dark_purple,
		},

		py = {
			icon = "",
			name = "py",
			color = base_30.cyan,
		},

		["robots.txt"] = {
			icon = "󰚩",
			name = "robots",
		},

		toml = {
			icon = "",
			name = "toml",
			color = base_30.blue,
		},

		ts = {
			icon = "󰛦",
			name = "ts",
			color = base_30.blue,
		},

		ttf = {
			icon = "",
			name = "TrueTypeFont",
			color = base_30.white,
		},

		rb = {
			icon = "",
			name = "rb",
			color = base_30.pink,
		},

		rpm = {
			icon = "",
			name = "rpm",
			color = base_30.orange,
		},

		vue = {
			icon = "󰡄",
			name = "vue",
			color = base_30.vibrant_green,
		},

		woff = {
			icon = "",
			name = "WebOpenFontFormat",
			color = base_30.white,
		},

		woff2 = {
			icon = "",
			name = "WebOpenFontFormat2",
			color = base_30.white,
		},

		xz = {
			icon = "",
			name = "xz",
			color = base_30.sun,
		},

		zip = {
			icon = "",
			name = "zip",
			color = base_30.sun,
		},
	},
}
