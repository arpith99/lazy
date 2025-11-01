return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Custom terminal keybindings
      local Terminal = require("toggleterm.terminal").Terminal

      -- Floating terminal (default)
      vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle floating terminal" })

      -- Horizontal terminal (bottom)
      vim.keymap.set(
        "n",
        "<leader>th",
        "<cmd>ToggleTerm size=15 direction=horizontal<cr>",
        { desc = "Toggle horizontal terminal" }
      )

      -- Vertical terminal (right)
      vim.keymap.set(
        "n",
        "<leader>tv",
        "<cmd>ToggleTerm size=80 direction=vertical<cr>",
        { desc = "Toggle vertical terminal" }
      )

      -- Exit terminal mode easily
      vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Go to left window" })
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Go to lower window" })
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Go to upper window" })
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Go to right window" })
    end,
  },
}
