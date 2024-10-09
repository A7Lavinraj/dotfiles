-- map leader
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
keymap.set("n", "<C-n>", ":tabnew <cr>", opts)
keymap.set("n", "<S-h>", "<cmd> BufferLineCyclePrev <cr>", opts)
keymap.set("n", "<S-l>", "<cmd> BufferLineCycleNext <cr>", opts)
keymap.set("n", "<leader>x", "<cmd> bdelete <cr>", opts)
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
keymap.set("n", "<leader>gc", "<cmd> Telescope git_branches <cr>", opts)
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

-- formatting
keymap.set("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Spectre
keymap.set("n", "<leader>s", "<cmd> Spectre <cr>", opts)

-- Fugitive
keymap.set("n", "<leader>g", ":vertical Git <cr>", opts)

-- build commands
keymap.set(
  "n",
  "<leader>rr",
  "<cmd> w <bar> " .. math.floor(vim.o.columns / 2) .. "vsplit <bar> term dbrun %:p <cr> <insert>",
  opts
)
keymap.set(
  "n",
  "<leader>rt",
  "<cmd> w <bar> " .. math.floor(vim.o.columns / 2) .. "vsplit <bar> term runsamples %:p <cr> <insert>",
  opts
)
keymap.set(
  "n",
  "<leader>rp",
  "<cmd> w <bar> " .. math.floor(vim.o.columns / 2) .. "vsplit <bar> term ipython3 <cr> <insert>",
  opts
)

-- competitive programming
keymap.set("n", "<leader>p", function()
  vim.ui.select(
    { "codechef contest", "codeforces contest", "codechef problem", "codeforces problem" },
    { prompt = "choose mode" },
    function(mode)
      if mode == "codechef contest" then
        vim.ui.input({ prompt = "contest code" }, function(code)
          if code then
            vim.system({ "codechef_sample_gen", "contest", code }, { text = true }, function()
              print("Samples fetched sucessfully!")
            end)
          end
        end)
      elseif mode == "codeforces contest" then
        vim.ui.input({ prompt = "contest code" }, function(code)
          if code then
            vim.system({ "codeforces_sample_gen", "contest", code }, { text = true }, function()
              print("Samples fetched sucessfully!")
            end)
          end
        end)
      elseif mode == "codechef problem" then
        vim.ui.input({ prompt = "contest code" }, function(code)
          if code then
            vim.system({ "codeforces_sample_gen", "problem", code }, { text = true }, function()
              print("Samples fetched sucessfully!")
            end)
          end
        end)
      elseif mode == "codeforces problem" then
        vim.ui.input({ prompt = "contest code" }, function(code)
          if code then
            vim.system({ "codeforces_sample_gen", "problem", code }, { text = true }, function()
              print("Samples fetched sucessfully!")
            end)
          end
        end)
      end
    end
  )
end, opts)
