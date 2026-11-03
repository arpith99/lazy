-- Colorscheme lists shared by the F7/F8 cycling keymaps and the random startup pick.
-- Names in `light` must render light with `background=light` (verified by loading each
-- one and checking the Normal background luminance).
local M = {}

M.dark = {
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
  "gruvbox-material",
  "vscode",
  "onenord",
  "oxocarbon",
  "nordic",
  "melange",
  "night-owl",
  "nightfly",
}

M.light = {
  "tokyonight-day",
  "catppuccin",
  "dawnfox",
  "dayfox",
  "kanagawa-lotus",
  "rose-pine-dawn",
  "material-lighter",
  "github_light",
  "gruvbox",
  "everforest",
  "solarized",
  "onedark",
  "gruvbox-material",
  "vscode",
  "onenord-light",
  "oxocarbon",
  "melange",
  "edge",
  "zenbones",
  "rosebones",
  "seoulbones",
  "vimbones",
  "zenwritten",
}

--- Apply a colorscheme with the given background ("dark" or "light") and notify.
function M.apply(name, background)
  vim.o.background = background
  vim.cmd.colorscheme(name)
  vim.notify("Colorscheme: " .. name .. " (" .. background .. ")", vim.log.levels.INFO)
end

return M
