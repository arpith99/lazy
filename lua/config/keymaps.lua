-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remove conflicting LazyVim default keymaps
local function del_keymap(mode, key)
  pcall(vim.keymap.del, mode, key)
end

-- Remove window management defaults that conflict
del_keymap("n", "<leader>wd")
del_keymap("n", "<leader>wm")
del_keymap("n", "<leader>w-")
del_keymap("n", "<leader>w|")

-- Remove session management defaults that conflict
del_keymap("n", "<leader>qq")
del_keymap("n", "<leader>ql")
del_keymap("n", "<leader>qs")
del_keymap("n", "<leader>qS")
del_keymap("n", "<leader>qd")

-- Remove Lazy plugin manager default that conflicts
del_keymap("n", "<leader>l")
del_keymap("n", "<leader>L")

-- Remove debug/DAP defaults that conflict with <leader>d
for _, suffix in ipairs({ "a", "b", "c", "C", "d", "e", "g", "h", "i", "o", "O", "p", "r", "s", "t", "u", "w" }) do
  del_keymap("n", "<leader>d" .. suffix)
end

-- Remove harpoon defaults that conflict with <leader>h
del_keymap("n", "<leader>h")
del_keymap("n", "<leader>H")

-- Remove Snacks git status default so fugitive can use it
del_keymap("n", "<leader>gs")

-- Remove H and L buffer navigation to restore default Vim functionality (H=top, L=bottom)
del_keymap("n", "H")
del_keymap("n", "L")

-- Note: <leader>a AI keymaps are overridden by our config since we moved Avante to <leader>v

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

-- Taglist toggle
vim.keymap.set("n", "<F9>", "<cmd>TlistToggle<cr>", { desc = "Toggle Taglist" })

-- Save and quit shortcuts
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("n", "<leader>w", "<cmd>wq<cr>", { desc = "Save and quit" })
vim.keymap.set("n", "<leader>q", "<cmd>qa!<cr>", { desc = "Quit all (force)" })
vim.keymap.set("n", "<leader>d", "<cmd>q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>a", "<cmd>wqa<cr>", { desc = "Save all and quit" })

-- Window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

-- Buffer navigation (remap gt/gT from tabs to buffers)
vim.keymap.set("n", "gt", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "gT", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Trouble LSP at bottom
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble lsp toggle focus=true win.position=bottom win.size.height=0.2<cr>", { desc = "Trouble LSP (bottom)" })

-- Fugitive keymaps (override LazyVim defaults)
vim.keymap.set("n", "<leader>gs", function()
  vim.cmd("topleft Git")
  -- Resize to 30% of editor height
  local height = math.floor(vim.o.lines * 0.3)
  vim.cmd("resize " .. height)
end, { desc = "Git status (fugitive)" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff split" })
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push --force<cr>", { desc = "Git push --force" })
vim.keymap.set("n", "<leader>gP", "<cmd>Git pull<cr>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gB", "<cmd>GBrowse<cr>", { desc = "Git browse (GitHub)" })
vim.keymap.set("n", "<leader>gl", "<cmd>Git lo<cr>", { desc = "Git lo (fugitive)" })
