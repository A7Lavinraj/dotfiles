vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { silent = true, noremap = true }

-- General
keymap.set("n", "<leader>q", ":qa! <cr>", opts)
keymap.set("n", "<leader>a", "gg<S-v>G", opts)
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Window
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)
keymap.set("n", "<leader>tn", ":tabnew <cr>", opts)
keymap.set("n", "<S-h>", "<cmd> BufferLineCyclePrev <cr>", opts)
keymap.set("n", "<S-l>", "<cmd> BufferLineCycleNext <cr>", opts)
keymap.set("n", "<leader>x", "<cmd> bd <cr>", opts)
keymap.set("n", "<C-Up>", ":resize -2 <cr>", opts)
keymap.set("n", "<C-Down>", ":resize +2 <cr>", opts)
keymap.set("n", "<C-Left>", ":vertical resize -2 <cr>", opts)
keymap.set("n", "<C-Right>", ":vertical resize +2 <cr>", opts)
keymap.set("n", "<leader>sh", ":split <cr>", opts)
keymap.set("n", "<leader>sv", ":vsplit <cr>", opts)

-- Oil.nvim
keymap.set("n", "<leader>e", function()
	require("oil").toggle_float()
end, opts)

-- Telescope
keymap.set("n", "<leader>ff", "<cmd> Telescope find_files <cr>", opts)
keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <cr>", opts)
keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <cr>", opts)
keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags  <cr>", opts)
keymap.set("n", "<leader>fs", function()
	require("telescope.builtin").find_files({
		cwd = "/home/lavinraj/coding/cp/code-library/",
	})
end, opts)
keymap.set("n", "<leader>fc", function()
	require("telescope.builtin").find_files({
		cwd = "/home/lavinraj/.config/nvim/",
	})
end, opts)

-- Spectre
keymap.set("n", "<leader>s", "<cmd> Spectre <cr>", opts)

-- Fugitive
keymap.set("n", "<leader>g", ":vertical Git <cr>", opts)

-- build commands
keymap.set("n", "<leader>r", "<cmd> w <bar> 70vsplit <bar> term dbrun %:p <cr> <insert>")
keymap.set("n", "<leader>t", "<cmd> w <bar> 70vsplit <bar> term runsamples %:p <cr> <insert>")
