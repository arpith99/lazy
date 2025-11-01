-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set random colorscheme on startup
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("random_colorscheme", { clear = true }),
  callback = function()
    local colorschemes = {
      "tokyonight-night",
      "catppuccin",
      "sonokai",
      "monokai",
      "gruvbox",
      "nord",
      "dracula",
      "onedark",
      "kanagawa",
      "nightfox",
      "rose-pine",
      "everforest",
      "solarized",
      "material",
      "github_dark",
      "moonfly",
      "substrata",
    }
    math.randomseed(os.time())
    local random_scheme = colorschemes[math.random(#colorschemes)]
    vim.cmd.colorscheme(random_scheme)
  end,
})

-- Auto-open Snacks explorer and Taglist on startup
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("auto_explorer_taglist", { clear = true }),
  callback = function()
    vim.schedule(function()
      local main_win = vim.api.nvim_get_current_win()
      Snacks.explorer()
      vim.cmd("TlistOpen")
      -- Return focus to the main editor window
      vim.schedule(function()
        vim.api.nvim_set_current_win(main_win)
      end)
    end)
  end,
})
