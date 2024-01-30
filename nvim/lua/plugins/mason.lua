return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
      ensure_installed = {
        "lua_ls",
        "clangd",
        "tsserver",
        "rust_analyzer",
        "html",
        "cssls",
        "svelte",
        "prismals",
        "pyright",
        "bashls",
        "yamlls",
        "gopls",
        "jsonls",
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "prettierd",
        "stylua",
        "isort",
        "black",
        "eslint-lsp",
      },
    },
  },
}
