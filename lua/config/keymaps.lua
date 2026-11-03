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

-- Remove H and L buffer navigation to restore default Vim functionality (H=top, L=bottom)
del_keymap("n", "H")
del_keymap("n", "L")

-- Colorscheme cycling: F7 cycles dark schemes, F8 cycles light ones
local schemes = require("config.colorschemes")
local dark_index, light_index = 1, 1

vim.keymap.set("n", "<F7>", function()
  dark_index = dark_index % #schemes.dark + 1
  schemes.apply(schemes.dark[dark_index], "dark")
end, { desc = "Cycle dark colorschemes" })

vim.keymap.set("n", "<F8>", function()
  light_index = light_index % #schemes.light + 1
  schemes.apply(schemes.light[light_index], "light")
end, { desc = "Cycle light colorschemes" })

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
