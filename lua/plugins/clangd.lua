-- Extends LazyVim's lang.clangd extra: use the system clangd instead of Mason's
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = { mason = false },
      },
    },
  },
}
