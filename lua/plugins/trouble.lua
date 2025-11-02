return {
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        lsp = {
          position = "bottom",
          win = {
            position = "bottom",
            size = { height = 0.2 }, -- max 20%
          },
          auto_resize = true, -- Auto-resize based on content
        },
        diagnostics = {
          position = "bottom",
          win = {
            position = "bottom",
            size = { height = 0.2 },
          },
          auto_resize = true,
        },
      },
      focus = false,
      auto_close = false,
      auto_refresh = true,
      open_no_results = true,
    },
  },
}
