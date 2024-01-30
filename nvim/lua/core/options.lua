---@diagnostic disable: undefined-field

local opt = vim.opt

-- global statusline
opt.laststatus = 3

-- fat cursor
opt.guicursor = ""

-- disable cmd messages
opt.showmode = false

-- enable system clipboard
opt.clipboard = "unnamedplus"

-- (optional) cursorline has no effect if transparent.nvim is enable
opt.cursorline = true

-- scrolloff for cursor
opt.scrolloff = 8

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- statusline characters
opt.fillchars = { eob = " " }

-- enhance searching
opt.ignorecase = true
opt.smartcase = true

-- disable mouse
opt.mouse = ""

-- numberline
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

-- disable highlight search
opt.hlsearch = false

-- no wrap
opt.wrap = false

-- disable nvim intro
opt.shortmess:append("sI")

-- enbale signcolumn
opt.signcolumn = "yes"

-- default split from bottom-right
opt.splitbelow = true
opt.splitright = true

-- enable guicolors
opt.termguicolors = true

-- keybind mapping sequence
opt.timeoutlen = 400

-- file recovery
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")
opt.iskeyword:append("-")

-- disable some default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
