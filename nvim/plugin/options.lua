local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.expandtab = true

-- Better search settings
opt.ignorecase = true
opt.smartcase = true

-- Opens up a split window for selections
opt.inccommand = "split"

opt.fillchars = { eob = " " }

-- Disable highlight search
opt.hlsearch = false

-- Global statusline
opt.laststatus = 3

-- Enable numbers with relative numbers
opt.number = true
opt.relativenumber = true

-- Indentation (I prefer "2" spaces of indent)
opt.shiftwidth = 2
opt.tabstop = 2

-- Allow signcolumn for various indicators
opt.signcolumn = "yes"

-- Always open a split in below + right direction
opt.splitbelow = true
opt.splitright = true

-- Disable swap files
opt.swapfile = false

-- Enable undofile
opt.undofile = true

-- Disable line wrapping
opt.wrap = false

opt.linebreak = true

opt.scrolloff = 10

-- disable some default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
