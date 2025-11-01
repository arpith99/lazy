return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatReset",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatFixDiagnostic",
      "CopilotChatCommit",
      "CopilotChatCommitStaged",
    },
    keys = {
      { "<leader>pp", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat", mode = { "n", "v" } },
      { "<leader>px", "<cmd>CopilotChatReset<cr>", desc = "Reset Copilot Chat" },
      { "<leader>pq", "<cmd>CopilotChatClose<cr>", desc = "Close Copilot Chat" },
      {
        "<leader>pe",
        "<cmd>CopilotChatExplain<cr>",
        desc = "Explain code",
        mode = { "n", "v" },
      },
      {
        "<leader>pr",
        "<cmd>CopilotChatReview<cr>",
        desc = "Review code",
        mode = { "n", "v" },
      },
      {
        "<leader>pf",
        "<cmd>CopilotChatFix<cr>",
        desc = "Fix code",
        mode = { "n", "v" },
      },
      {
        "<leader>po",
        "<cmd>CopilotChatOptimize<cr>",
        desc = "Optimize code",
        mode = { "n", "v" },
      },
      {
        "<leader>pd",
        "<cmd>CopilotChatDocs<cr>",
        desc = "Generate docs",
        mode = { "n", "v" },
      },
      {
        "<leader>pt",
        "<cmd>CopilotChatTests<cr>",
        desc = "Generate tests",
        mode = { "n", "v" },
      },
      {
        "<leader>pD",
        "<cmd>CopilotChatFixDiagnostic<cr>",
        desc = "Fix diagnostic",
      },
      {
        "<leader>pm",
        "<cmd>CopilotChatCommit<cr>",
        desc = "Generate commit message",
      },
      {
        "<leader>pM",
        "<cmd>CopilotChatCommitStaged<cr>",
        desc = "Generate commit message (staged)",
      },
    },
    opts = {
      debug = false,
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float'
        width = 0.4,
        height = 0.6,
        relative = "editor",
        border = "rounded",
      },
      mappings = {
        complete = {
          detail = "Use @<Tab> or /<Tab> for options.",
          insert = "<Tab>",
        },
        close = {
          normal = "q",
          insert = "<C-c>",
        },
        reset = {
          normal = "<C-r>",
          insert = "<C-r>",
        },
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        accept_diff = {
          normal = "<C-y>",
          insert = "<C-y>",
        },
        yank_diff = {
          normal = "gy",
        },
        show_diff = {
          normal = "gd",
        },
        show_system_prompt = {
          normal = "gp",
        },
        show_user_selection = {
          normal = "gs",
        },
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)
    end,
  },
}
