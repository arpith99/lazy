return {
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history (current)" },
      { "<leader>gdH", "<cmd>DiffviewFileHistory<cr>", desc = "File history (all)" },
      { "<leader>gdt", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle file panel" },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = {
          layout = "diff2_horizontal",
        },
        merge_tool = {
          layout = "diff3_horizontal",
        },
      },
    },
  },
}
