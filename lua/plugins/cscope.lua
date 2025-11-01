return {
  {
    "dhananjaylatkar/cscope_maps.nvim",
    dependencies = {
      "folke/which-key.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      disable_maps = true, -- Disable defaults, we'll set custom ones
      skip_input_prompt = false, -- false prompts for input
      cscope = {
        db_file = "./cscope.out", -- location of cscope database file
        exec = "cscope", -- cscope executable
        picker = "telescope", -- "telescope", "fzf-lua" or "quickfix"
        skip_picker_for_single_result = false, -- if true, skip picker if only one result
        db_build_cmd = { args = { "-bqkv" } }, -- new format for cscope database build args
        qf_window_size = 10, -- quickfix window height
      },
    },
    config = function(_, opts)
      require("cscope_maps").setup(opts)

      -- Helper function to create cscope keymaps with picker switching
      local function cscope_keymap(key, query_type, picker, desc)
        vim.keymap.set("n", key, function()
          require("cscope_maps").setup({ cscope = { picker = picker, qf_window_size = 10 } })
          vim.cmd("Cscope find " .. query_type .. " " .. vim.fn.expand("<cword>"))
        end, { desc = desc })
      end

      -- <leader>o prefix - using 'snacks' picker
      cscope_keymap("<leader>os", "s", "snacks", "Cscope (snacks): Find symbol")
      cscope_keymap("<leader>og", "g", "snacks", "Cscope (snacks): Find global definition")
      cscope_keymap("<leader>oc", "c", "snacks", "Cscope (snacks): Find functions calling this")
      cscope_keymap("<leader>ot", "t", "snacks", "Cscope (snacks): Find text string")
      cscope_keymap("<leader>oe", "e", "snacks", "Cscope (snacks): Find egrep pattern")
      cscope_keymap("<leader>of", "f", "snacks", "Cscope (snacks): Find file")
      cscope_keymap("<leader>oi", "i", "snacks", "Cscope (snacks): Find files including this")
      cscope_keymap("<leader>od", "d", "snacks", "Cscope (snacks): Find functions called by this")
      cscope_keymap("<leader>oa", "a", "snacks", "Cscope (snacks): Find assignments to symbol")

      -- <leader>m prefix - using 'quickfix' picker
      cscope_keymap("<leader>ms", "s", "quickfix", "Cscope (quickfix): Find symbol")
      cscope_keymap("<leader>mg", "g", "quickfix", "Cscope (quickfix): Find global definition")
      cscope_keymap("<leader>mc", "c", "quickfix", "Cscope (quickfix): Find functions calling this")
      cscope_keymap("<leader>mt", "t", "quickfix", "Cscope (quickfix): Find text string")
      cscope_keymap("<leader>me", "e", "quickfix", "Cscope (quickfix): Find egrep pattern")
      cscope_keymap("<leader>mf", "f", "quickfix", "Cscope (quickfix): Find file")
      cscope_keymap("<leader>mi", "i", "quickfix", "Cscope (quickfix): Find files including this")
      cscope_keymap("<leader>md", "d", "quickfix", "Cscope (quickfix): Find functions called by this")
      cscope_keymap("<leader>ma", "a", "quickfix", "Cscope (quickfix): Find assignments to symbol")

      -- Build database command (works for both)
      vim.keymap.set("n", "<leader>ob", "<cmd>Cscope build<cr>", { desc = "Cscope: Build database" })
      vim.keymap.set("n", "<leader>mb", "<cmd>Cscope build<cr>", { desc = "Cscope: Build database" })
    end,
  },
}
