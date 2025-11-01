-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Colorscheme cycling
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
local current_index = 1

vim.keymap.set("n", "<F7>", function()
  current_index = current_index % #colorschemes + 1
  local colorscheme = colorschemes[current_index]
  vim.cmd.colorscheme(colorscheme)
  vim.notify("Colorscheme: " .. colorscheme, vim.log.levels.INFO)
end, { desc = "Cycle colorschemes" })
