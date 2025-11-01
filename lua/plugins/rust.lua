return {
  -- Rustaceanvim - Modern Rust plugin
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
          -- Automatically set inlay hints
          inlay_hints = {
            auto = true,
          },
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- Keybindings for Rust-specific features
            vim.keymap.set("n", "<leader>rr", function()
              vim.cmd.RustLsp("runnables")
            end, { buffer = bufnr, desc = "Rust: Runnables" })

            vim.keymap.set("n", "<leader>rd", function()
              vim.cmd.RustLsp("debuggables")
            end, { buffer = bufnr, desc = "Rust: Debuggables" })

            vim.keymap.set("n", "<leader>rt", function()
              vim.cmd.RustLsp("testables")
            end, { buffer = bufnr, desc = "Rust: Testables" })

            vim.keymap.set("n", "<leader>re", function()
              vim.cmd.RustLsp("explainError")
            end, { buffer = bufnr, desc = "Rust: Explain Error" })

            vim.keymap.set("n", "<leader>rc", function()
              vim.cmd.RustLsp("openCargo")
            end, { buffer = bufnr, desc = "Rust: Open Cargo.toml" })

            vim.keymap.set("n", "<leader>rp", function()
              vim.cmd.RustLsp("parentModule")
            end, { buffer = bufnr, desc = "Rust: Parent Module" })

            vim.keymap.set("n", "K", function()
              vim.cmd.RustLsp({ "hover", "actions" })
            end, { buffer = bufnr, desc = "Rust: Hover Actions" })

            vim.keymap.set("n", "<leader>ra", function()
              vim.cmd.RustLsp("codeAction")
            end, { buffer = bufnr, desc = "Rust: Code Action" })
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
              checkOnSave = {
                allFeatures = true,
                command = "clippy",
                extraArgs = { "--no-deps" },
              },
              procMacro = {
                enable = true,
                ignored = {
                  ["async-trait"] = { "async_trait" },
                  ["napi-derive"] = { "napi" },
                  ["async-recursion"] = { "async_recursion" },
                },
              },
            },
          },
        },
      }
    end,
  },

  -- Crates.nvim - Cargo.toml dependency management
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      completion = {
        cmp = {
          enabled = true,
        },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
    config = function(_, opts)
      require("crates").setup(opts)

      -- Keybindings for crates.nvim (only in Cargo.toml)
      vim.api.nvim_create_autocmd("BufRead", {
        group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
        pattern = "Cargo.toml",
        callback = function()
          local crates = require("crates")

          vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { buffer = true, desc = "Crates: Show versions" })
          vim.keymap.set(
            "n",
            "<leader>cf",
            crates.show_features_popup,
            { buffer = true, desc = "Crates: Show features" }
          )
          vim.keymap.set(
            "n",
            "<leader>cd",
            crates.show_dependencies_popup,
            { buffer = true, desc = "Crates: Show dependencies" }
          )
          vim.keymap.set("n", "<leader>cu", crates.update_crate, { buffer = true, desc = "Crates: Update crate" })
          vim.keymap.set("v", "<leader>cu", crates.update_crates, { buffer = true, desc = "Crates: Update crates" })
          vim.keymap.set("n", "<leader>cU", crates.update_all_crates, { buffer = true, desc = "Crates: Update all" })
          vim.keymap.set("n", "<leader>cg", crates.upgrade_crate, { buffer = true, desc = "Crates: Upgrade crate" })
          vim.keymap.set("v", "<leader>cg", crates.upgrade_crates, { buffer = true, desc = "Crates: Upgrade crates" })
          vim.keymap.set("n", "<leader>cG", crates.upgrade_all_crates, { buffer = true, desc = "Crates: Upgrade all" })
          vim.keymap.set("n", "<leader>cx", crates.expand_plain_crate_to_inline_table, {
            buffer = true,
            desc = "Crates: Expand to inline",
          })
          vim.keymap.set("n", "<leader>cX", crates.extract_crate_into_table, {
            buffer = true,
            desc = "Crates: Extract to table",
          })
          vim.keymap.set("n", "<leader>cH", crates.open_homepage, { buffer = true, desc = "Crates: Open homepage" })
          vim.keymap.set("n", "<leader>cR", crates.open_repository, { buffer = true, desc = "Crates: Open repository" })
          vim.keymap.set(
            "n",
            "<leader>cD",
            crates.open_documentation,
            { buffer = true, desc = "Crates: Open documentation" }
          )
          vim.keymap.set("n", "<leader>cC", crates.open_crates_io, { buffer = true, desc = "Crates: Open crates.io" })
        end,
      })
    end,
  },
}
