return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      svelte = { "prettierd" },
      markdown = { "prettierd" },
      lua = { "stylua" },
      go = { "gofmt" },
    },
    format_after_save = {
      timeout_ms = 500,
    },
  },
}
