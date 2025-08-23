local M = {}

M.servers = {
  cssls = {},
  marksman = {},
  gopls = {},
  ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
  },
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          },
        },
        diagnostics = {
          globals = { "vim" },
        },
        completion = {
          callSnippet = "Replace",
        },
        doc = {
          privateName = { "^_" },
        },
      },
    },
  },
}

return M
