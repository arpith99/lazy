return {
  {
    "coder/claudecode.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("claudecode").setup({
        -- Configuration options
      })
    end,
    keys = {
      { "<leader>zz", "<cmd>ClaudeCode<cr>", desc = "Open Claude Code" },
      { "<leader>zr", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude Code", mode = { "n", "v" } },
      { "<leader>za", "<cmd>ClaudeCodeAsk<cr>", desc = "Claude Code Ask", mode = { "n", "v" } },
      { "<leader>ze", "<cmd>ClaudeCodeExplain<cr>", desc = "Claude Code Explain", mode = { "n", "v" } },
      { "<leader>zf", "<cmd>ClaudeCodeFix<cr>", desc = "Claude Code Fix", mode = { "n", "v" } },
    },
  },
}
