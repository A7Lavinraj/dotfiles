return {
  "nvzone/showkeys",
  cmd = "ShowkeysToggle",
  opts = {
    timeout = 1,
    maxkeys = 5,
    position = "top-right",
  },
  config = function()
    vim.cmd("showkeysToggle")
  end,
}
