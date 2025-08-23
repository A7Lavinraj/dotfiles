return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "b0o/schemastore.nvim" },
    {
      "j-hui/fidget.nvim",
      opts = {},
    },
    {
      "mason-org/mason.nvim",
      dependencies = {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          automatic_enable = false,
        },
      },
      opts = {},
    },
    {
      "saghen/blink.cmp",
      version = "1.*",
      dependencies = {
        { "rafamadriz/friendly-snippets" },
      },
      opts = {
        keymap = {
          preset = "enter",
        },
        fuzzy = {
          implementation = "prefer_rust_with_warning",
        },
        sources = {
          default = { "lsp", "path", "snippets", "buffer" },
          per_filetype = {
            sql = { "snippets", "dadbod", "buffer" },
          },
          providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
          },
        },
      },
    },
  },
  opts = {
    servers = require("custom.lsp").servers,
  },
  config = function(_, opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LSPAttach", { clear = true }),
      callback = function(arg)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = arg.buf, desc = "LSP: " .. desc })
        end

        -- stylua: ignore
        map("K", function() vim.lsp.buf.hover { border = "single" } end, "LSP Documentation")
        map("<leader>cd", vim.diagnostic.open_float, "LSP Diagnostics")
        map("grn", vim.lsp.buf.rename, "LSP Rename")
        map("gra", vim.lsp.buf.code_action, "Goto Code Action", { "n", "x" })
        map("grr", require("telescope.builtin").lsp_references, "Goto References")
        map("gri", require("telescope.builtin").lsp_implementations, "Goto Implementation")
        map("grd", require("telescope.builtin").lsp_definitions, "Goto Definition")
        map("grD", vim.lsp.buf.declaration, "Goto Declaration")
        map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
        map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
        map("grt", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")

        local client = vim.lsp.get_client_by_id(arg.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, arg.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup("LSPHighlights", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = arg.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = arg.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("LSPDetach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = "LSPHighlights", buffer = event2.buf }
            end,
          })
        end
      end,
    })

    local blink_cmp = require "blink.cmp"
    local lspconfig = require "lspconfig"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_lsp_servers = require("mason-lspconfig.mappings").get_all().lspconfig_to_package
    local ensure_installed = {}
    opts.servers.jsonls = {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }
    opts.servers.yamlls = {
      settings = {
        yaml = {
          schemaStore = {
            enable = false,
            url = "",
          },
          schemas = require("schemastore").yaml.schemas(),
        },
      },
    }

    for server, _ in pairs(opts.servers) do
      if mason_lsp_servers[server] then
        table.insert(ensure_installed, server)
      end
    end

    local function merge(...)
      return vim.tbl_deep_extend("force", ...)
    end
    mason_lspconfig.setup { ensure_installed = ensure_installed }
    for server, server_opts in pairs(opts.servers) do
      lspconfig[server].setup(merge(server_opts, {
        capabilities = merge(vim.lsp.protocol.make_client_capabilities(), blink_cmp.get_lsp_capabilities()),
      }))
    end

    vim.diagnostic.config {
      virtual_text = { prefix = "" },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅙",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "󰋼",
          [vim.diagnostic.severity.HINT] = "󰌵",
        },
      },
      underline = true,
      float = { border = "single" },
    }
  end,
}
