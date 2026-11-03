-- Extends LazyVim's lang.rust extra (see lazyvim.json)
return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        -- Replaces the extra's on_attach, so its <leader>cR / <leader>dr are kept here
        on_attach = function(_, bufnr)
          local function map(lhs, cmd, desc)
            vim.keymap.set("n", lhs, function()
              vim.cmd.RustLsp(cmd)
            end, { buffer = bufnr, desc = desc })
          end
          map("<leader>cR", "codeAction", "Code Action")
          map("<leader>dr", "debuggables", "Rust Debuggables")
          map("<leader>rr", "runnables", "Rust: Runnables")
          map("<leader>rd", "debuggables", "Rust: Debuggables")
          map("<leader>rt", "testables", "Rust: Testables")
          map("<leader>re", "explainError", "Rust: Explain Error")
          map("<leader>rc", "openCargo", "Rust: Open Cargo.toml")
          map("<leader>rp", "parentModule", "Rust: Parent Module")
          map("<leader>ra", "codeAction", "Rust: Code Action")
        end,
        default_settings = {
          ["rust-analyzer"] = {
            -- Clippy on save, all features, skip dependencies
            check = {
              command = "clippy",
              allFeatures = true,
              extraArgs = { "--no-deps" },
            },
          },
        },
      },
    },
  },
  {
    -- K must go through LazyVim's LSP keys to override its global hover;
    -- enabled = false only registers the keys, rustaceanvim runs the server
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["rust-analyzer"] = {
          enabled = false,
          keys = {
            {
              "K",
              function()
                vim.cmd.RustLsp({ "hover", "actions" })
              end,
              desc = "Rust: Hover Actions",
            },
          },
        },
      },
    },
  },
}
