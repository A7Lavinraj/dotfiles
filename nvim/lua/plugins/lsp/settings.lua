return {
  html = {},
  gopls = {},
  ts_ls = {},
  jsonls = {},
  pyright = {},
  svelte = {},
  tailwindcss = {},
  dockerls = {},
  prismals = {},
  cssls = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = false,
          library = {
            "${3rd}/luv/library",
            unpack(vim.api.nvim_get_runtime_file("", true)),
          },
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
  clangd = {
    cmd = { "clangd", "-header-insertion=never" },
  },
  vimls = {
    filetypes = { "vim" },
  },
  yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
  },
}
