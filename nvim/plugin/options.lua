local set = vim.opt

-- Clipboard
set.clipboard = "unnamedplus"

-- Enable numbers and relative numbers
set.number = true
set.relativenumber = true

-- Disable highlight search
set.hlsearch = false

-- Custom statusline
set.laststatus = 3
set.statusline = "%#Conceal#█ %F%#Normal#"

-- Global indentation
set.expandtab = true
set.shiftwidth = 2
set.tabstop = 2

-- No wrap
set.wrap = false

-- Cursor margin from top-bottom
set.scrolloff = 10

-- Enable signcolumn
set.signcolumn = "yes"

-- splits
set.splitright = true
set.splitbelow = true

-- Search
set.ignorecase = true
set.smartcase = true

-- No swap files
set.swapfile = false
