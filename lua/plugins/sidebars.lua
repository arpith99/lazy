-- Narrower explorer (left) and symbol outline (right)
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = { layout = { layout = { width = 30, min_width = 30 } } },
        },
      },
    },
  },
  {
    "stevearc/aerial.nvim",
    opts = {
      layout = { default_direction = "right", width = 30, min_width = 30 },
    },
    keys = {
      -- <leader>cs stays on the Trouble LSP panel (see keymaps.lua)
      { "<leader>cs", false },
      { "<F9>", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial (symbols)" },
    },
  },
}
