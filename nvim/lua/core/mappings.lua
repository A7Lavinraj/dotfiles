local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

-- General
keymap("n", "<leader>q", ":qa! <CR>", opts)
keymap("n", "<leader>a", "gg<S-v>G", opts)
keymap("n", "<leader>ya", ":%y+ <CR>", opts)
keymap("v", "J", ":m '>+1 <CR> gv=gv", opts)
keymap("v", "K", ":m '>-2 <CR> gv=gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Fugitive
keymap("n", "<leader>g", ":vertical Git <CR>", opts)

-- Window
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>tn", ":tabnew <CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev <CR>", opts)
keymap("n", "<S-l>", ":BufferLineCycleNext <CR>", opts)
keymap("n", "<leader>x", ":bd <CR>", opts)
keymap("n", "<C-Up>", ":resize -2 <CR>", opts)
keymap("n", "<C-Down>", ":resize +2 <CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2 <CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2 <CR>", opts)
keymap("n", "<leader>sh", ":split <CR>", opts)
keymap("n", "<leader>sv", ":vsplit <CR>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle toggle <CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers <CR>", opts)
keymap("n", "<leader>fw", ":Telescope live_grep <CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags  <CR>", opts)
keymap("n", "<leader>fs", function()
	require("telescope.builtin").find_files({
		cwd = "/home/lavinraj/coding/cp/code-library/",
	})
end, opts)

-- Code formatting
keymap("n", "<leader>lf", vim.lsp.buf.format, opts)
