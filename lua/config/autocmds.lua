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
    local colorschemes = require("config.colorschemes").dark
    math.randomseed(os.time())
    local random_scheme = colorschemes[math.random(#colorschemes)]
    vim.o.background = "dark"
    vim.cmd.colorscheme(random_scheme)
  end,
})
