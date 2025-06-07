local options = {
  -- enable number line
  number = true,

  -- enable relative number line
  relativenumber = true,

  -- disable highlight search
  hlsearch = false,

  -- enable tab expansion
  expandtab = true,

  -- auto indentation width
  shiftwidth = 2,

  -- tab indentation width
  tabstop = 2,

  -- clipboard
  clipboard = "unnamedplus",

  -- enable undotree
  undofile = true,

  -- always split below
  splitbelow = true,

  -- always split right
  splitright = true,

  -- global statusline
  laststatus = 0,

  -- enable sign column
  signcolumn = "yes",

  -- case insensitive search
  ignorecase = true,
  smartcase = true,
  incsearch = true,

  -- set no wrap
  wrap = false,

  -- scroll offset
  scrolloff = 8,

  -- fat cursor
  -- guicursor = "",
}

for key, value in pairs(options) do
  vim.o[key] = value
end

-- Removes end-of-buffer markers
vim.opt.fillchars:append({ eob = " " })

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
