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
        -- JavaScript/TypeScript
        ts_ls = {},
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

  -- Better LSP UI
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        ui = {
          border = "rounded",
          code_action = "",
        },
        lightbulb = {
          enable = false,
          sign = false,
        },
        diagnostic = {
          show_code_action = true,
          show_source = true,
          jump_num_shortcut = true,
          max_width = 0.7,
          max_height = 0.6,
          text_hl_follow = false,
          border_follow = true,
          keys = {
            exec_action = 'o',
            quit = 'q',
          },
        },
      })

      -- Configure vim diagnostics to use floating windows
      vim.diagnostic.config({
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
    keys = {
      { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover Documentation" },
      { "<leader>K", function() vim.diagnostic.open_float() end, desc = "Show Diagnostics" },
      { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto Definition" },
      { "gD", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek Definition" },
      { "gr", "<cmd>Lspsaga finder<CR>", desc = "Find References" },
      { "gI", "<cmd>Lspsaga finder imp<CR>", desc = "Goto Implementation" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
      { "<leader>rn", "<cmd>Lspsaga rename<CR>", desc = "Rename" },
      { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Symbol Outline" },
      { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous Diagnostic" },
      { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next Diagnostic" },
    },
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
