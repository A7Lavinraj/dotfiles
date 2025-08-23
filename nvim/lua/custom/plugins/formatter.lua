return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      go = { "gofmt -w" },
      markdown = { "prettierd" },
      lua = { "stylua" },
      html = { "prettierd" },
      css = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
    },
  },
}
