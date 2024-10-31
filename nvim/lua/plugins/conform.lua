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
    },
    format_on_save = {
      async = false,
      timeout_ms = 500
    }
  }
}
