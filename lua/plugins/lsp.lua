return {
  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      },
      servers = {
        -- Python
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
              pythonPath = vim.fn.exepath("python3"),
            },
          },
          before_init = function(_, config)
            -- Auto-detect virtualenv
            local venv = vim.fn.findfile("pyproject.toml", ".;")
            if venv ~= "" then
              config.settings.python.pythonPath = vim.fn.getcwd() .. "/.venv/bin/python"
            end
            -- Check for .venv directory
            local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
            if vim.fn.filereadable(venv_path) == 1 then
              config.settings.python.pythonPath = venv_path
            end
            -- Check for venv directory
            local venv_path2 = vim.fn.getcwd() .. "/venv/bin/python"
            if vim.fn.filereadable(venv_path2) == 1 then
              config.settings.python.pythonPath = venv_path2
            end
          end,
        },
        -- YAML
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://json.schemastore.org/package.json"] = "/package.json",
              },
            },
          },
        },
        -- ESLint
        eslint = {},
      },
    },
  },

  -- Disable lspsaga
  { "nvimdev/lspsaga.nvim", enabled = false },

  -- LSP keymaps using native vim.lsp and Telescope
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "K", function() vim.lsp.buf.hover() end, desc = "Hover Documentation" },
      { "<leader>K", function() vim.diagnostic.open_float() end, desc = "Show Diagnostics" },
      { "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() require("telescope.builtin").lsp_type_definitions() end, desc = "Type Definition" },
      { "gr", function() require("telescope.builtin").lsp_references() end, desc = "Find References" },
      { "gI", function() require("telescope.builtin").lsp_implementations() end, desc = "Goto Implementation" },
      { "<leader>ca", function() vim.lsp.buf.code_action() end, desc = "Code Action" },
      { "<leader>rn", function() vim.lsp.buf.rename() end, desc = "Rename" },
      { "<leader>o", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Document Symbols" },
      { "[d", function() vim.diagnostic.goto_prev() end, desc = "Previous Diagnostic" },
      { "]d", function() vim.diagnostic.goto_next() end, desc = "Next Diagnostic" },
    },
    init = function()
      vim.diagnostic.config({
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },

  -- Show function signature while typing
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
      hint_enable = false,
    },
  },
}
