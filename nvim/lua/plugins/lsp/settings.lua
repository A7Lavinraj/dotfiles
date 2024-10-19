return {
  ts_ls = {},
  jsonls = {},
  pyright = {},
  svelte = {},
  tailwindcss = {},
  cssls = {},
  lua_ls = {
    settings = {
      cmd = { "/home/lavin/.nix-profile/bin/lua-language-server" },
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
    cmd = { "/home/lavin/.nix-profile/bin/clangd", "-header-insertion=never" },
  },
  bashls = {
    filetypes = { "sh", "zsh" },
  },
  vimls = {
    filetypes = { "vim" },
  },
  yamlls = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
  },
}
