-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Run fn once startup is done. LazyVim loads this file after VimEnter when
-- nvim starts without a file, so a plain VimEnter autocmd would never fire.
local function on_startup(fn)
  if vim.v.vim_did_enter == 1 then
    fn()
  else
    vim.api.nvim_create_autocmd("VimEnter", { once = true, callback = fn })
  end
end

-- Set random colorscheme on startup
on_startup(function()
  local colorschemes = require("config.colorschemes").dark
  math.randomseed(os.time())
  local random_scheme = colorschemes[math.random(#colorschemes)]
  vim.o.background = "dark"
  vim.cmd.colorscheme(random_scheme)
end)

-- Auto-open Snacks explorer and Aerial on startup
on_startup(function()
  vim.schedule(function()
    local main_win = vim.api.nvim_get_current_win()
    require("aerial").open({ focus = false })
    Snacks.explorer({
      -- The explorer grabs focus once shown; hand it back to the editor
      on_show = function()
        vim.schedule(function()
          if vim.api.nvim_win_is_valid(main_win) then
            vim.api.nvim_set_current_win(main_win)
          end
        end)
      end,
    })
  end)
end)
